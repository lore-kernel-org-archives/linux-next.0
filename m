From: "Alexey Klimov" <klimov.linux@gmail.com>
Subject: Fwd: [patch] radio-mr800: remove info-macro
Date: Tue, 14 Oct 2008 09:54:59 +0400
Message-ID: <208cbae30810132254x7235f152h64018d88b488a073@mail.gmail.com>
References: <208cbae30810111605r38d9122bme0e4dfd7d6c8b736@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_48836_2097858.1223963699147"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from qb-out-0506.google.com ([72.14.204.229]:17597 "EHLO
	qb-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751751AbYJNFzA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Oct 2008 01:55:00 -0400
Received: by qb-out-0506.google.com with SMTP id f11so2062358qba.17
        for <linux-next@vger.kernel.org>; Mon, 13 Oct 2008 22:54:59 -0700 (PDT)
In-Reply-To: <208cbae30810111605r38d9122bme0e4dfd7d6c8b736@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>, Douglas Schilling Landgraf <dougsland@gmail.com>

------=_Part_48836_2097858.1223963699147
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Here, just look.

---------- Forwarded message ----------
From: Alexey Klimov <klimov.linux@gmail.com>
Date: Sun, Oct 12, 2008 at 3:05 AM
Subject: [patch] radio-mr800: remove info-macro
To: Douglas Schilling Landgraf <dougsland@gmail.com>


Hello, Douglas!
Here is the patch, that removes 3 info()-statements in radio-mr800,
and place standart printk() there.

Signed-off-by: Alexey Klimov <klimov.linux@gmail.com>

-- 
Best regards, Klimov Alexey

------=_Part_48836_2097858.1223963699147
Content-Type: application/octet-stream;
 name=radio-mr800-remove-info-macro.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fm6uqn300
Content-Disposition: attachment;
 filename=radio-mr800-remove-info-macro.patch

ZGlmZiAtciA0MDkyZWQ5MDQxMmIgbGludXgvZHJpdmVycy9tZWRpYS9yYWRpby9yYWRpby1tcjgw
MC5jCi0tLSBhL2xpbnV4L2RyaXZlcnMvbWVkaWEvcmFkaW8vcmFkaW8tbXI4MDAuYwlTdW4gT2N0
IDEyIDAxOjM0OjQzIDIwMDggKzA0MDAKKysrIGIvbGludXgvZHJpdmVycy9tZWRpYS9yYWRpby9y
YWRpby1tcjgwMC5jCVN1biBPY3QgMTIgMDI6NTU6MzIgMjAwOCArMDQwMApAQCAtNTA4LDcgKzUw
OCw3IEBACiAJaWYgKGFtcmFkaW9fc3RvcChyYWRpbykgPCAwKQogCQl3YXJuKCJhbXJhZGlvX3N0
b3AoKSBmYWlsZWQiKTsKIAotCWluZm8oInJhZGlvLW1yODAwOiBHb2luZyBpbnRvIHN1c3BlbmQu
LiIpOworCXByaW50ayhLRVJOX0lORk8gS0JVSUxEX01PRE5BTUUgIjogR29pbmcgaW50byBzdXNw
ZW5kLi5cbiIpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC01MjEsNyArNTIxLDcgQEAKIAlpZiAoYW1y
YWRpb19zdGFydChyYWRpbykgPCAwKQogCQl3YXJuKCJhbXJhZGlvX3N0YXJ0KCkgZmFpbGVkIik7
CiAKLQlpbmZvKCJyYWRpby1tcjgwMDogQ29taW5nIG91dCBvZiBzdXNwZW5kLi4iKTsKKwlwcmlu
dGsoS0VSTl9JTkZPIEtCVUlMRF9NT0ROQU1FICI6IENvbWluZyBvdXQgb2Ygc3VzcGVuZC4uXG4i
KTsKIAogCXJldHVybiAwOwogfQpAQCAtNjE1LDcgKzYxNSw4IEBACiB7CiAJaW50IHJldHZhbCA9
IHVzYl9yZWdpc3RlcigmdXNiX2FtcmFkaW9fZHJpdmVyKTsKIAotCWluZm8oRFJJVkVSX1ZFUlNJ
T04gIiAiIERSSVZFUl9ERVNDKTsKKwlwcmludGsoS0VSTl9JTkZPIEtCVUlMRF9NT0ROQU1FICI6
ICIKKwkJCURSSVZFUl9WRVJTSU9OICIgIiBEUklWRVJfREVTQyAiXG4iKTsKIAlpZiAocmV0dmFs
KQogCQllcnIoInVzYl9yZWdpc3RlciBmYWlsZWQuIEVycm9yIG51bWJlciAlZCIsIHJldHZhbCk7
CiAJcmV0dXJuIHJldHZhbDsK
------=_Part_48836_2097858.1223963699147--
