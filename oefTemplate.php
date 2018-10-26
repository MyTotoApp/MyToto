<?php
include 'header.php';
?>

<?php
$conn= dbconnect();

$sql = "SELECT `match_date`, cl1.`club_id`, cl1.`club_name` AS home, 
		cl2.club_id, cl2.`club_name` AS away, `match_home_goals`, `match_away_goals`, cmp1.competition_name
		FROM tbl_match"
    . "    JOIN tbl_clubs AS cl1 ON match_home_id = cl1.club_id\n"
    . "    JOIN tbl_clubs AS cl2 ON match_away_id = cl2.club_id\n"
    . "    JOIN tbl_competitions AS cmp1 ON match_competition = cmp1.competition_id\n"
    . "    ORDER BY match_id ASC";
$result = $conn->query($sql);

?> 
<div class="container">
  <div class="row">
    <div class="col-md-6">
      <table class="table table-bordered table-hover">
        <?php
        if ($result->num_rows > 0) 
        {
          
          while($row = $result->fetch_assoc()) 
          {
            echo "<tr><td>";
            echo $row["match_date"];
			echo "<td>";
			echo $row["home"];
			echo "<td>";
            echo $row["match_home_goals"];
			echo "<td>-<td>";
            echo $row["match_away_goals"];
            echo "<td>";echo $row["away"];
			echo "<td>";
            echo $row["competition_name"];


           }
        } else 
        {
          echo "0 results";
        }
        $conn->close();
        ?>
      </table></div>
      <div class="col-md-6"><img src="images/logoToto.jpg" class="img-responsive" alt="Responsive image"></div>
    </div>
  </div>

<?php
include 'footer.php';
?>