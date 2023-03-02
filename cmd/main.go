package main

import (
	"bufio"
	"fmt"
	"os"
)

type Point struct {
	x float64
	y float64
	z float64
}

var t float64

func findParam(a *Point, b *Point, c *Point, q *Point) float64 {
	t = (a.x*(c.z*b.y-c.y*b.z) - a.y*(c.z*b.x-c.x*b.z) + a.z*(c.y*b.x-c.x*b.y)) / (q.x*(c.z*b.y-a.z*b.y-a.y*c.z-c.y*b.z+a.y*b.z+a.z*c.y) - q.y*(c.z*b.x-a.z*b.x-a.x*c.z-c.x*b.z+a.x*b.z+a.z*c.x) + q.z*(c.y*b.x-a.y*b.x-a.x*c.y-c.x*b.y+a.x*b.y+a.y*c.x))

	return t
}

func main() {
	a := Point{}
	b := Point{}
	c := Point{}
	q := Point{}
	fmt.Println("Введите координаты точки A(в виде: x y z): ")
	fmt.Scan(&a.x, &a.y, &a.z)
	fmt.Println("Введите координаты точки B(в виде: x y z): ")
	fmt.Scan(&b.x, &b.y, &b.z)
	fmt.Println("Введите координаты точки C(в виде: x y z): ")
	fmt.Scan(&c.x, &c.y, &c.z)
	fmt.Println("Введите координаты точки Q(в виде: x y z): ")
	fmt.Scan(&q.x, &q.y, &q.z)
	findParam(&a, &b, &c, &q)
	if t >= 1 {
		fmt.Println("Точка видна")
	} else if t < 1 {
		fmt.Println("Точка не видна")
	}

	fmt.Println("Write 'exit' to quit")
	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {
		exit := scanner.Text()
		if exit == "exit" {
			break
		}
	}
}
