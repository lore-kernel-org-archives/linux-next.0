From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: linux-next broken by "ARM: S3C2440: move mach-s3c2440/* into mach-s3c24xx/"
Date: Thu, 8 Mar 2012 21:44:53 +0100
Message-ID: <201203082144.54156.heiko@sntech.de>
References: <20120308162326.GA30941@windriver.com> <20120308191207.GC7557@sirena.org.uk> <4F590F74.2030007@windriver.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:40865 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751169Ab2CHUpN convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Mar 2012 15:45:13 -0500
In-Reply-To: <4F590F74.2030007@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, kgene.kim@samsung.com, ben-linux@fluff.org, tiwai@suse.de, linux-next@vger.kernel.org

Am Donnerstag 08 M=E4rz 2012, 20:58:44 schrieb Paul Gortmaker:
> On 12-03-08 02:12 PM, Mark Brown wrote:
> > On Thu, Mar 08, 2012 at 11:23:26AM -0500, Paul Gortmaker wrote:
> >> Something bad happened in this commit (dd6f01b5cc).  It looks like
> >> the moved file is truncated, causing this failure:
> >>=20
> >> http://kisskb.ellerman.id.au/kisskb/buildresult/5818815/
> >>=20
> >> I believe it came in via the fix/asoc tree.
> >=20
> > Hrm?  What is "it" in this context, and what was your analysis here=
?
> > Nothing in the page you're linking to above suggests something audi=
o
> > related...
>=20
> The "it" was the commit in the subject, and the ID in the above text.
> That was the last commit to have touched this file (via moving it).
>=20
> What I took as a relation to fix/asoc was shown in the text you've
> gone and deleted here in the follow up.
>=20
> In any case, it does appear the file was broken before it was moved.
> The offending commit is actually c1ba544f81544ed9613ad5d058968533dbce=
f4b2
>=20
> 	"ARM: S3C24XX: Fix restart on S3C2442"
>=20
> It appears that a closing brace was dropped when it was integrated.

kgene wrote in "[PATCH] ARM: S3C2440: Fixed build error for s3c244x":
> This happened when I applied Heiko's 'Fix restart on S3C2442'.
> It was my fault :( and this should be sent before release v3.3.

and was applied by Olof today.


Heiko
