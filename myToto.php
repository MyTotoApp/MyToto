<?php
include 'header.php';
?>

<?php
$conn = dbconnect();

$sql = "SELECT DATE_FORMAT(`match_date`, '%d-%m-%Y') AS match_date, cl1.`club_id`, cl1.`club_name` AS home,\n"
    . "        		cl2.club_id, cl2.`club_name` AS away, `match_home_goals`, `match_away_goals`, cmp1.competition_name, st.status, ef.effort, qu.quotation, pr.prediction\n"
    . "        		FROM tbl_matches\n"
    . "                JOIN tbl_clubs AS cl1 ON match_home_id = cl1.club_id\n"
    . "                JOIN tbl_clubs AS cl2 ON match_away_id = cl2.club_id\n"
    . "                JOIN tbl_competitions AS cmp1 ON match_competition = cmp1.competition_id\n"
    . "                JOIN tbl_statuses AS st ON match_status = st.status_id\n"
    . "                JOIN tbl_efforts AS ef ON match_effort = ef.effort_id\n"
    . "                JOIN tbl_quotations AS qu ON match_quotation = qu.quotation_id\n"
    . "                JOIN tbl_predictions AS pr ON match_prediction = pr.prediction\n"
    . "                ORDER BY match_id ASC";

$result = $conn->query($sql);

?>

<div class="container">
  <div class="row">
    <div class="col-md-12">
      <table class="table table-bordered table-hover">

          <thead>
            <tr>
                <th scope="col">Home</th>
                <th scope="col">Score</th>
                <th scope="col">Away</th>
                <th scope="col">Competition</th>
                <th scope="col">Prediction</th>
                <th scope="col">Date</th>
                <th scope="col">Effort</th>
                <th scope="col">Quotation</th>
                <th scope="col">Status</th>
            </tr>
          </thead>

            <?php
            if ($result->num_rows > 0)
            {

              while($row = $result->fetch_assoc())
              {
                echo "<tr><td>";
                echo $row["home"];
                echo "<td>";
                echo $row["match_home_goals"] . ' - ' .  $row["match_away_goals"];
                echo "<td>";echo $row["away"];
                echo "<td>";
                echo $row["competition_name"];
                echo "<td>";
                echo $row["prediction"];
                echo "<td>";
                echo $row["match_date"];
                echo "<td>";
                echo $row["effort"];
                echo "<td>";
                echo $row["quotation"];
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

        $sql = "SELECT match_id, COUNT(*) AS Aantal FROM `tbl_matches`";

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

        $sql = "SELECT match_status, COUNT(*) AS aantal FROM tbl_matches GROUP BY match_status";

        $result = $conn->query($sql);

        if ($result->num_rows > 0)
        {

            while($row = $result->fetch_assoc())
            {
                $Betswon = $row['aantal'];

                if ($result->num_rows > 0)
                {

                    while($row = $result->fetch_assoc())
                    {
                        $Betslost = $row['aantal'];
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

        $sql = "SELECT SUM(quotation-effort) AS Opbrengst FROM `tbl_matches` INNER JOIN tbl_quotations ON quotation_id = match_quotation INNER JOIN tbl_efforts ON effort_id = match_effort WHERE match_status = 1 GROUP BY match_status";

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

        $sql = "SELECT SUM(effort) AS Verlies FROM `tbl_matches` INNER JOIN tbl_quotations ON quotation_id = match_quotation INNER JOIN tbl_efforts ON effort_id = match_effort WHERE match_status = 2";

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

        $conn->close();

        ?>

    </div>

      <div class="col-md-3">

        <table class="table table-bordered table-hover">

            <thead>
            <tr>
                <th colspan="2"> MyToto Statistics</th>
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
                    echo "$Winpercentage%";

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

    </div>
  </div>

<?php
include 'footer.php';
?>