<?php
namespace SongLyrics\Service;

class RandomLine
{
    protected $data = [];

    public function getRandomLine()
    {
        $lines      = count($this->data);
        $lineNumber = rand(0, $lines-1);

        return $this->data[$lineNumber];
    }

    /**
     * Sets the data value for the class
     *
     * @param array $data
     *
     * @return static
     */
    public function setData(array $data)
    {
        $this->data = $data;
        return $this;
    }

    /**
     * @return array
     */
    public function getData()
    {
        return $this->data;
    }
}