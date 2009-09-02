From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: linux-next / s390 crypto breakage
Date: Wed, 2 Sep 2009 13:35:26 +0200
Message-ID: <20090902113526.GC4754@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate6.uk.ibm.com ([195.212.29.139]:59488 "EHLO
	mtagate6.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751830AbZIBLfu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2009 07:35:50 -0400
Received: from d06nrmr1806.portsmouth.uk.ibm.com (d06nrmr1806.portsmouth.uk.ibm.com [9.149.39.193])
	by mtagate6.uk.ibm.com (8.14.3/8.13.8) with ESMTP id n82BZbOJ150628
	for <linux-next@vger.kernel.org>; Wed, 2 Sep 2009 11:35:42 GMT
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com [9.149.37.212])
	by d06nrmr1806.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id n82BZQTo491534
	for <linux-next@vger.kernel.org>; Wed, 2 Sep 2009 12:35:26 +0100
Received: from d06av01.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n82BZQCn018291
	for <linux-next@vger.kernel.org>; Wed, 2 Sep 2009 12:35:26 +0100
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Jan Glauber <jang@linux.vnet.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org

Hi Herbert,

your patch "crypto: shash - Export/import hash state only" causes this
on s390:

  CC      arch/s390/crypto/sha1_s390.o
arch/s390/crypto/sha1_s390.c: In function 'sha1_import':
arch/s390/crypto/sha1_s390.c:63: warning: initialization from incompatible pointer type
arch/s390/crypto/sha1_s390.c: At top level:
arch/s390/crypto/sha1_s390.c:78: warning: initialization from incompatible pointer type
  CC      arch/s390/crypto/sha_common.o
  CC      arch/s390/crypto/sha256_s390.o
arch/s390/crypto/sha256_s390.c: In function 'sha256_import':
arch/s390/crypto/sha256_s390.c:59: warning: initialization from incompatible pointer type
arch/s390/crypto/sha256_s390.c: At top level:
arch/s390/crypto/sha256_s390.c:74: warning: initialization from incompatible pointer type
  CC      arch/s390/crypto/sha512_s390.o
arch/s390/crypto/sha512_s390.c: In function 'sha512_import':
arch/s390/crypto/sha512_s390.c:58: warning: initialization from incompatible pointer type
arch/s390/crypto/sha512_s390.c: At top level:
arch/s390/crypto/sha512_s390.c:76: warning: initialization from incompatible pointer type
arch/s390/crypto/sha512_s390.c:115: warning: initialization from incompatible pointer type

Looks like you missed some conversions. Could you (or Jan?) fix this please?

Thanks!
