From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: wireless tree build failure
Date: Mon, 9 Nov 2009 14:37:14 +0100
Message-ID: <200911091437.14465.bzolnier@gmail.com>
References: <20091109190812.b2f75760.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f207.google.com ([209.85.219.207]:48396 "EHLO
	mail-ew0-f207.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755891AbZKINi6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Nov 2009 08:38:58 -0500
In-Reply-To: <20091109190812.b2f75760.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


Hi,

On Monday 09 November 2009 09:08:12 Stephen Rothwell wrote:
> Hi John,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:

This was fixed yesterday by Hauke Mehrtens for wireless-testing
(http://patchwork.kernel.org/patch/58495/) and in the way preserving
bisectability in rt2800 tree.

Stephen, until someone explains me how they would like to coordinate
patch-flow w/ rt2800 tree please do not cc: me on rt2x00 patches as
I have completely no control over what people are doing with my patches
posted to linux-wireless for review.

[ Yesterday I've just noticed by accident (mail from Hauke) that older
  versions of my patches were merged into wireless-testing. ]

--
Bartlomiej Zolnierkiewicz
