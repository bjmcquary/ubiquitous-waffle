$words = Get-Content 'C:\Users\bailey.mcquary\OneDrive - Asurion\Documents\sgb-words.txt'
$scoredwords = @{}

foreach ($guess in $words){
    $guesschar = $guess.ToCharArray()
    $guessscore = 0
    foreach ($answer in $words){
        $answerchar = $answer.ToCharArray()
        $i = 0
        $value = 0
        foreach ($gcharacter in $guesschar){
            if ($gcharacter -eq $answerchar[$i]) { $value += 3 }
            elseif ($answerchar -contains $gcharacter) { $value +=2 }
            else { $value += 1 }
            $i++
        }
        $guessscore += $value
    }
    $scoredwords.Add($guess, $guessscore)

}

echo $scoredwords | Sort-Object | select -f 5