<?php
include 'header.php';
?>

<?php

$user = 2;

$conn = dbconnect();

?>

    <form action="myToto.php" method="post">

            <div class="col-md-12">

                <?php

                $sql = "SELECT DISTINCT match_user, user_firstname FROM `tbl_matches` INNER JOIN tbl_users ON user_id = match_user";

                $result = $conn->query($sql);

                ?>

                <select name="user">

                    <?php

                    if ($result->num_rows > 0)

                    {

                    while($row = $result->fetch_assoc())
                    {
                        $Username = $row['user_firstname'];

                        ?>

                        <option><?php echo $row['match_user'] ?></option>

                    <?php }

                    ?>

                </select>

            <?php
            } else

            {
                echo "0 results";
            }

            $conn->close();

            //SELECT competition_name, match_status, COUNT(*) FROM `tbl_matches` INNER JOIN tbl_competitions on match_competition = competition_id WHERE match_competition = 4 AND match_user = $user GROUP BY match_status

            ?>

                <input type="submit" value="Select">

            </div>

    </form>

<?php
include 'footer.php';
?>