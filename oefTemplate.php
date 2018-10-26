<?php
include 'header.php';
?>

<?php
$conn= dbconnect();

$sql = "SELECT `match_date`, cl1.`club_id`, cl1.`club_name` AS home, \n"

    . "		cl2.club_id, cl2.`club_name` AS away, `match_home_goals`, `match_away_goals`, cmp1.competition_name, st.status\n"
    . "		FROM tbl_match\n"
    . "        JOIN tbl_clubs AS cl1 ON match_home_id = cl1.club_id\n"
    . "        JOIN tbl_clubs AS cl2 ON match_away_id = cl2.club_id\n"
    . "        JOIN tbl_competitions AS cmp1 ON match_competition = cmp1.competition_id\n"
    . "        JOIN tbl_status AS st ON match_status = st.status_id\n"
    . "        ORDER BY match_id ASC";

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
                <th scope="col">Date</th>
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
                echo $row["match_date"];
                echo "<td>";
                echo $row["status"];


               }
            } else
            {
              echo "0 results";
            }
            $conn->close();
            ?>
      </table></div>

    </div>
  </div>

<?php
include 'footer.php';
?>