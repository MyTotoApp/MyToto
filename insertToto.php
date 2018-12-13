<?php
include 'header.php';
?>

<?php

$conn = dbconnect();

?>

    <form action="myToto.php" method="post">

        <div class="col-md-12">

            <?php

            $sql = "SELECT club_name FROM `tbl_clubs` ORDER BY club_name ASC";

            $result = $conn->query($sql);

            ?>

            <select name="club_home">

                <?php

                if ($result->num_rows > 0)

                {

                while($row = $result->fetch_assoc())
                {
                    $clubhome = $row['club_name'];

                    ?>

                    <option><?php echo $clubhome; ?></option>

                <?php }

                ?>

            </select>

        <?php
        } else

        {
            echo "0 results";
        }

        ?>

        <select name="club_away">

                <?php

                $result = $conn->query($sql);

                if ($result->num_rows > 0)

                {

                while($row = $result->fetch_assoc())
                {
                    $clubhome = $row['club_name'];

                    ?>

            <option><?php echo $clubhome; ?></option>

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

        </div>

    </form>

<?php
include 'footer.php';
?>