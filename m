From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Fri, 25 Nov 2011 10:30:11 +0000
Message-ID: <20111125103011.18e167cd@lxorguk.ukuu.org.uk>
References: <20111116113007.5656a7b4823ba085a46c57ae@canb.auug.org.au>
	<20111125124913.405fc8360a185f3116adb5ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:46078 "EHLO
	earthlight.etchedpixels.co.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753705Ab1KYK2z (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 25 Nov 2011 05:28:55 -0500
In-Reply-To: <20111125124913.405fc8360a185f3116adb5ec@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Rob Clark <rob.clark@linaro.org>

> Ping?

As I said last time you asked this - the correct merge resolution is to
pull the DRM updates and mark the staging GMA500 Kconfig "&& BROKEN". The
staging driver is frozen while we merge outside of staging and will not
be getting any attention at this point - changes there just mess up the
move work which is far more important.

Also nothing in staging should be allowed to hold up real work. The
resolution for anything in staging blocking merges is to mark the staging
parts && BROKEN IMHO

Alan
