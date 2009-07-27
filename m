From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: linux-next: drbd tree build failure
Date: Mon, 27 Jul 2009 15:38:44 +0400
Message-ID: <a4423d670907270438n3e8f07caoa45124b1bd7b2386@mail.gmail.com>
References: <20090727173754.6a04e781.sfr@canb.auug.org.au>
	 <200907271109.33271.philipp.reisner@linbit.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f226.google.com ([209.85.219.226]:49672 "EHLO
	mail-ew0-f226.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884AbZG0Lip (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2009 07:38:45 -0400
In-Reply-To: <200907271109.33271.philipp.reisner@linbit.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Philipp Reisner <philipp.reisner@linbit.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

One more issue

drivers/block/drbd/drbd_main.c: In function 'drbd_buildtag':
drivers/block/drbd/drbd_main.c:3738: error: dereferencing pointer to
incomplete type
