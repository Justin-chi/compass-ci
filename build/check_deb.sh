#/bin/bash
set -e

export DEB_DIR="$1"
export MD5SUMFILE="${DEB_DIR}/md5deb.txt"
export MD5SUMFILE_BAK="${DEB_DIR}/md5deb.txt.bk"
OLDSUM=
NEWSUM=

if [ ! -f ${MD5SUMFILE_BAK} ]
then
	echo "MD5 file is not exist, so need rebuild iso"
	find ${DEB_DIR} -type f -print0 | xargs -0 md5sum | grep -v "md5deb.txt" | tee ${MD5SUMFILE}
	mv ${MD5SUMFILE} ${MD5SUMFILE_BAK}
	exit 0 
else
	echo "MD5 file is exist, so check whether update"
	find ${DEB_DIR} -type f -print0 | xargs -0 md5sum | grep -v "md5deb.txt" | tee ${MD5SUMFILE}
	NEWSUM=`md5sum ${MD5SUMFILE} |cut -d' ' -f1`
	OLDSUM=`md5sum ${MD5SUMFILE_BAK} |cut -d' ' -f1`
	if [ ${NEWSUM} != ${OLDSUM} ]
	then
		echo "md5sum is different, so need rebuild iso"
		mv ${MD5SUMFILE} ${MD5SUMFILE_BAK}
		exit 0
	else
		echo "md5sum is the same, no need rebuild"
		exit 1
	fi
fi

