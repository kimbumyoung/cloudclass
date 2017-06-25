function checkImageType(fileName) {
	var pattern = /jpg|gif|png/i;
	return fileName.match(pattern);
}

function getFileInfo(fullName) {

	var fileName, imgsrc, getLink;
	var fileLink;

	if (checkImageType(fullName)) {
		imgsrc = "/freeupload/displayFile?fileName=" + fullName;
		fileLink = fullName.substr(14);

		var front = fullName.substr(0, 12);
		var end = fullName.substr(14);

		getLink = "/freeupload/displayFile?fileName=" + front + end;
	} else {
		imgsrc = "/freeupload/resources/dist/img/file.png";
		fileLink = fullName.substr(12);
		getLink = "/freeupload/displayFile?fileName=" + fullName;
	}
	fileName = fileLink.substr(fileLink.indexOf("_") + 1);

	return {
		fileName : fileName,
		imgsrc : imgsrc,
		getLink : getLink,
		fullName : fullName
	};
}
