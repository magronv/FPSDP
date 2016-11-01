#!/bin/bash

rm -f all_results

rm -f rigidbody1_results
folders=$(ls -tr rigidbody1*_results)
for i in $folders;
do
	cat $i >> rigidbody1_results ;
	echo >> rigidbody1_results ;
done

echo "**********rigidbody1" >> all_results;
cat rigidbody1_results >> all_results;

rm -f rigidbody2_results
folders=$(ls -tr rigidbody2*_results)
for i in $folders;
do
	cat $i >> rigidbody2_results ;
	echo >> rigidbody2_results ;
done

echo "**********rigidbody2" >> all_results;
cat rigidbody2_results >> all_results;

rm -f kepler0_results
folders=$(ls -tr kepler0*_results)
for i in $folders;
do
	cat $i >> kepler0_results ;
	echo >> kepler0_results ;
done

echo "**********kepler0" >> all_results;
cat kepler0_results >> all_results;

rm -f kepler1_results
folders=$(ls -tr kepler1*_results)
for i in $folders;
do
	cat $i >> kepler1_results ;
	echo >> kepler1_results ;
done

echo "**********kepler1" >> all_results;
cat kepler1_results >> all_results;

rm -f kepler2_results
folders=$(ls -tr kepler2*_results)
for i in $folders;
do
	cat $i >> kepler2_results ;
	echo >> kepler2_results ;
done

echo "**********kepler2" >> all_results;
cat kepler2_results >> all_results;

rm -f sineTaylor_results
folders=$(ls -tr sineTaylor*_results)
for i in $folders;
do
	cat $i >> sineTaylor_results ;
	echo >> sineTaylor_results ;
done

echo "**********sineTaylor" >> all_results;
cat sineTaylor_results >> all_results;

rm -f sineOrder3_results
folders=$(ls -tr sineOrder3*_results)
for i in $folders;
do
	cat $i >> sineOrder3_results ;
	echo >> sineOrder3_results ;
done

echo "**********sineOrder3" >> all_results;
cat sineOrder3_results >> all_results;

rm -f sqroot_results
folders=$(ls -tr sqroot*_results)
for i in $folders;
do
	cat $i >> sqroot_results ;
	echo >> sqroot_results ;
done

echo "**********sqroot" >> all_results;
cat sqroot_results >> all_results;

rm -f himmilbeau_results
folders=$(ls -tr himmilbeau*_results)
for i in $folders;
do
	cat $i >> himmilbeau_results ;
	echo >> himmilbeau_results ;
done

echo "**********himmilbeau" >> all_results;
cat himmilbeau_results >> all_results;
