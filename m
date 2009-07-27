From: Philipp Reisner <philipp.reisner@linbit.com>
Subject: Re: linux-next: drbd tree build failure
Date: Mon, 27 Jul 2009 17:07:58 +0200
Message-ID: <200907271707.58733.philipp.reisner@linbit.com>
References: <20090727173754.6a04e781.sfr@canb.auug.org.au> <200907271109.33271.philipp.reisner@linbit.com> <a4423d670907270438n3e8f07caoa45124b1bd7b2386@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail09.linbit.com ([212.69.161.110]:48534 "EHLO
	mail09.linbit.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750718AbZG0PH7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2009 11:07:59 -0400
In-Reply-To: <a4423d670907270438n3e8f07caoa45124b1bd7b2386@mail.gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Monday 27 July 2009 13:38:44 Alexander Beregalov wrote:
> One more issue
>
> drivers/block/drbd/drbd_main.c: In function 'drbd_buildtag':
> drivers/block/drbd/drbd_main.c:3738: error: dereferencing pointer to
> incomplete type

Ohh, right. I have never tried to build a kernel with the DRBD patch
without CONFIG_MODULES set.

It is fixed now.

-Phil
-- 
: Dipl-Ing Philipp Reisner
: LINBIT | Your Way to High Availability
: Tel: +43-1-8178292-50, Fax: +43-1-8178292-82
: http://www.linbit.com

DRBD(R) and LINBIT(R) are registered trademarks of LINBIT, Austria.
