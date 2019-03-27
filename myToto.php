<?php

include 'header.php';

?>



<?php



$conn = dbconnect();



$user = $_POST['user'];



$sql = "SELECT DISTINCT match_user, user_firstname\n"



    . "FROM `tbl_matches`\n"



    . "INNER JOIN tbl_users ON match_user = user_id\n"



    . "WHERE match_user = $user";



$result = $conn->query($sql);



?>



    <div class="container">

        <div class="row">

            <div class="col-md-14">

                <table class="table table-bordered table-hover">



                    <thead>



                        <th colspan="10">



                            <?php



                            if ($result->num_rows > 0)

                            {

                                while($row = $result->fetch_assoc())

                                {

                                    echo $row["user_firstname"];

                                }



                            } else

                            {

                                echo "0 results";

                            }



                            ?>



                            <tr>



                                <th scope="col">Home</th>

                                <th scope="col">Score</th>

                                <th scope="col">Away</th>

                                <th scope="col">Competition</th>

                                <th scope="col">Prediction</th>

                                <th scope="col">Type</th>

                                <th scope="col">Date</th>

                                <th scope="col">Effort</th>

                                <th scope="col">Quotation</th>

                                <th scope="col">Status</th>



                            </tr>



                        </th>



                    </thead>



                    <?php



                    $user = $_POST['user'];



                    $sql = "SELECT DATE_FORMAT(`match_date`, '%d-%m-%Y') AS match_date, match_double_id, cl1.`club_id`, cl1.`club_name` AS home,\n"

                        . "       		cl2.club_id, cl2.`club_name` AS away, `match_home_goals`, `match_away_goals`, match_effort, match_confirmation, match_quotation, cmp1.competition_name, st.status, pr.prediction, us.user_firstname, ty.type_name\n"

                        . "        		FROM tbl_matches\n"

                        . "                JOIN tbl_clubs AS cl1 ON match_home_id = cl1.club_id\n"

                        . "                JOIN tbl_clubs AS cl2 ON match_away_id = cl2.club_id\n"

                        . "                JOIN tbl_competitions AS cmp1 ON match_competition = cmp1.competition_id\n"

                        . "                JOIN tbl_statuses AS st ON match_status = st.status_id\n"

                        . "                JOIN tbl_predictions AS pr ON match_prediction = pr.prediction_id\n"

                        . "                JOIN tbl_users AS us ON match_user = us.user_id\n"

                        . "                JOIN tbl_types AS ty ON match_type = ty.type_id\n"

                        . "                WHERE match_user = $user\n"

                        . "                ORDER BY match_id ASC";



                    $result = $conn->query($sql);



                    if ($result->num_rows > 0)

                    {



                        while($row = $result->fetch_assoc())

                        {



                            if ($row["match_double_id"] != "0" )

                            {

                                echo "<tr class='double'><td>";

                            }



                            else {

                                echo "<tr><td>";

                            }



                            echo $row["home"];

                            echo "<td>";

                            echo $row["match_home_goals"] . ' - ' .  $row["match_away_goals"];

                            echo "<td>"

                            ;echo $row["away"];

                            echo "<td>";

                            echo $row["competition_name"];

                            echo "<td>";

                            echo $row["prediction"];

                            echo "<td>";

                            echo $row["type_name"];

                            echo "<td>";

                            echo $row["match_date"];

                            echo "<td>";

                            echo $row["match_effort"];

                            echo "<td>";

                            echo $row["match_quotation"];

                            if ($row['match_double_id'] != 0) {
                              echo "<td rowspan=2>";

                              echo $row["status"];
                            }

                            echo "<td>";

                            echo $row["status"];



                        }

                    } else

                    {

                        echo "0 results";

                    }



                    ?>



                </table>



                <?php



                // Totaal weddenschappen



                $conn = dbconnect();



                $sql = "SELECT COUNT(DISTINCT match_confirmation) AS Aantal FROM `tbl_matches` WHERE match_user = $user";



                $result = $conn->query($sql);



                if ($result->num_rows > 0)

                {



                    while($row = $result->fetch_assoc())

                    {

                        $Totalbets = $row['Aantal'];

                    }

                } else

                {

                    echo "0 results";

                }



                // Totaal weddenschappen gewonnen & verloren



                $sql = "SELECT match_status, COUNT(DISTINCT match_confirmation) AS Aantal FROM tbl_matches  WHERE match_user = $user GROUP BY match_status";



                $result = $conn->query($sql);



                if ($result->num_rows > 0)

                {



                    while($row = $result->fetch_assoc())

                    {

                        $Betswon = $row['Aantal'];



                        if ($result->num_rows > 0)

                        {



                            while($row = $result->fetch_assoc())

                            {

                                $Betslost = $row['Aantal'];



                                if ($result->num_rows > 0)

                                {



                                    while ($row = $result->fetch_assoc())

                                    {



                                        $Betsopen = $row['Aantal'];



                                    }



                                } else

                                {

                                    echo "0 results";

                                }

                            }

                        } else

                        {

                            echo "0 results";

                        }



                    }

                } else

                {

                    echo "0 results";

                }



                // Totaal aantal win



                $sql = "SELECT FORMAT(SUM(match_quotation*match_effort-match_effort), 2) AS Opbrengst FROM `tbl_matches` WHERE match_status = 1 AND match_user = $user GROUP BY match_status";



                $result = $conn->query($sql);



                if ($result->num_rows > 0)

                {



                    while($row = $result->fetch_assoc())

                    {

                        $Totalwin = $row['Opbrengst'];

                    }

                } else

                {

                    echo "0 results";

                }



                // Totaal aantal verlies



                $sql = "SELECT FORMAT(SUM(match_effort), 2) AS Verlies FROM `tbl_matches` WHERE match_status = 2 AND match_user = $user";



                $result = $conn->query($sql);



                if ($result->num_rows > 0)

                {



                    while($row = $result->fetch_assoc())

                    {

                        $Totallose = $row['Verlies'];

                    }

                } else

                {

                    echo "0 results";

                }



                // Totaal winst & winpercentage



                $Income = $Totalwin - $Totallose;



                $Winpercentage = $Betswon / $Totalbets * 100;



                ?>



            </div>



            <div class="col-md-3">



                <table class="table table-bordered table-hover">



                    <thead>

                    <tr>

                        <th colspan="2">Bet Statistics</th>

                    </tr>

                    </thead>



                    <?php

                    echo "<tr><td>";

                    echo "Bets:";

                    echo "<td>";

                    echo $Totalbets;



                    echo "<tr><td>";

                    echo "Bets won:";

                    echo "<td>";

                    echo $Betswon;



                    echo "<tr><td>";

                    echo "Bets lost:";

                    echo "<td>";

                    echo $Betslost;



                    echo "<tr><td>";

                    echo "Win percentage:";

                    echo "<td>";

                    echo number_format("$Winpercentage", 0) . "%";



                    echo "<tr><td>";

                    echo "Total win:";

                    echo "<td>";

                    echo "€ $Totalwin";



                    echo "<tr><td>";

                    echo "Total lost:";

                    echo "<td>";

                    echo "€ $Totallose";



                    echo "<tr><td>";

                    echo "Income:";

                    echo "<td>";

                    echo "€ $Income";









                    ?>



                </table>

            </div>







            <div class="col-md-3">



                <table class="table table-bordered table-hover">



                    <thead>

                    <tr>

                        <th colspan="2">Bets per Competition</th>

                    </tr>

                    </thead>



                    <?php





                    $sql = "SELECT competition_name, COUNT(match_competition) AS Aantal FROM `tbl_matches` INNER JOIN tbl_competitions ON match_competition = competition_id WHERE match_user = $user GROUP BY match_competition ORDER BY Aantal DESC";



                    $result = $conn->query($sql);



                    if ($result->num_rows > 0)



                    {



                        while($row = $result->fetch_assoc())

                        {



                            echo "<tr><td>";

                            echo $row["competition_name"];

                            echo "<td>";

                            echo $row["Aantal"];



                        }

                    }else{



                        echo "0 results";



                    }



                    ?>



                </table>



            </div>





            <div class="col-md-3">



                <table class="table table-bordered table-hover">



                    <thead>

                    <tr>

                        <th colspan="2">Bets per Month</th>

                    </tr>

                    </thead>



                    <?php



                    // September



                    $sql = "SELECT COUNT(DISTINCT match_confirmation) AS September FROM `tbl_matches` WHERE match_date BETWEEN '2018-09-01' AND '2018-09-30' AND match_user = $user";



                    $result = $conn->query($sql);



                    if ($result->num_rows > 0)



                    {



                        while($row = $result->fetch_assoc())

                        {

                            $September = $row['September'];

                        }

                    }else{



                        echo "0 results";



                    }



                    // Oktober



                    $sql = "SELECT COUNT(DISTINCT match_confirmation) AS Oktober FROM `tbl_matches` WHERE match_date BETWEEN '2018-10-01' AND '2018-10-31' AND match_user = $user";



                    $result = $conn->query($sql);



                    if ($result->num_rows > 0)



                    {



                        while($row = $result->fetch_assoc())

                        {

                            $Oktober = $row['Oktober'];

                        }

                    }else{



                        echo "0 results";



                    }



                    // November



                    $sql = "SELECT COUNT(DISTINCT match_confirmation) AS November FROM `tbl_matches` WHERE match_date BETWEEN '2018-11-01' AND '2018-11-30' AND match_user = $user";



                    $result = $conn->query($sql);



                    if ($result->num_rows > 0)



                    {



                        while($row = $result->fetch_assoc())

                        {

                            $November = $row['November'];

                        }

                    }else{



                        echo "0 results";



                    }



                    // December



                    $sql = "SELECT COUNT(DISTINCT match_confirmation) AS December FROM `tbl_matches` WHERE match_date BETWEEN '2018-12-01' AND '2018-12-31' AND match_user = $user";



                    $result = $conn->query($sql);



                    if ($result->num_rows > 0)



                    {



                        while($row = $result->fetch_assoc())

                        {

                            $December = $row['December'];

                        }

                    }else{



                        echo "0 results";



                    }



                    // Januari



                    $sql = "SELECT COUNT(DISTINCT match_confirmation) AS Januari FROM `tbl_matches` WHERE match_date BETWEEN '2019-01-01' AND '2019-01-31' AND match_user = $user";



                    $result = $conn->query($sql);



                    if ($result->num_rows > 0)



                    {



                        while($row = $result->fetch_assoc())

                        {

                            $Januari = $row['Januari'];

                        }

                    }else{



                        echo "0 results";



                    }



                    // Februari



                    $sql = "SELECT COUNT(DISTINCT match_confirmation) AS Februari FROM `tbl_matches` WHERE match_date BETWEEN '2019-02-01' AND '2019-02-31' AND match_user = $user";



                    $result = $conn->query($sql);



                    if ($result->num_rows > 0)



                    {



                        while($row = $result->fetch_assoc())

                        {

                            $Februari = $row['Februari'];

                        }

                    }else{



                        echo "0 results";



                    }



                    echo "<tr><td>";

                    echo "September";

                    echo "<td>";

                    echo $September;



                    echo "<tr><td>";

                    echo "Oktober";

                    echo "<td>";

                    echo $Oktober;



                    echo "<tr><td>";

                    echo "November";

                    echo "<td>";

                    echo $November;



                    echo "<tr><td>";

                    echo "December";

                    echo "<td>";

                    echo $December;



                    echo "<tr><td>";

                    echo "Januari";

                    echo "<td>";

                    echo $Januari;



                    echo "<tr><td>";

                    echo "Februari";

                    echo "<td>";

                    echo $Februari;



                    ?>







                </table>



            </div>







            <div class="col-md-3">



                <table class="table table-bordered table-hover">



                    <thead>

                        <tr>

                            <th colspan="3">Last 5 bets</th>

                        </tr>

                    </thead>



                    <?php



                    $sql = "( SELECT match_id, match_home_goals, match_away_goals, prediction, status FROM `tbl_matches` INNER JOIN tbl_statuses on match_status = tbl_statuses.status_id INNER JOIN tbl_predictions on match_prediction = tbl_predictions.prediction_id ORDER BY match_id DESC LIMIT 5 ) ORDER BY match_id ASC";



                    $result = $conn->query($sql);



                    if ($result->num_rows > 0)



                    {



                        while($row = $result->fetch_assoc())

                        {

                            echo "<tr><td>";

                            echo $row["match_home_goals"] . " - " . $row["match_away_goals"];

                            echo "<td>";

                            echo $row["prediction"];

                            echo "<td>";

                            echo $row["status"];



                        }

                    }else{



                        echo "0 results";



                    }





                    ?>







                </table>



            </div>







            <div class="col-md-3">



                <?php



                $sql = "SELECT DISTINCT match_user, user_firstname FROM `tbl_matches` INNER JOIN tbl_users ON user_id = match_user";



                $result = $conn->query($sql);



                ?>



                <form action="myToto.php" method="post">



                    <select name="user">



                        <?php



                        if ($result->num_rows > 0)



                        {



                        while($row = $result->fetch_assoc())

                        {



                            ?>



                            <option name="<?php $row['match_user']; ?>"><?php echo $row['match_user']; ?></option>



                        <?php }



                        ?>



                    </select>







                    <?php

                    } else



                    {

                        echo "0 results";

                    }



                    $conn->close();



                    ?>



                    <input type="submit" value="Select">



                </form>



            </div>

        </div>

    </div>



<?php

include 'footer.php';

?>
