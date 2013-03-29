From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH -next] sound/soc/codecs: Mark snd-soc-wm2200 and
 snd-soc-wm-adsp as BROKEN
Date: Fri, 29 Mar 2013 17:12:29 +0000
Message-ID: <20130329171229.GD18316@opensource.wolfsonmicro.com>
References: <1364566347-29941-1-git-send-email-peter@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EUKSLY24k2f/9z8U"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:35363 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754701Ab3C2RMd (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Mar 2013 13:12:33 -0400
Content-Disposition: inline
In-Reply-To: <1364566347-29941-1-git-send-email-peter@hurleysoftware.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Xiong Zhou <jencce.kernel@gmail.com>


--EUKSLY24k2f/9z8U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 29, 2013 at 10:12:27AM -0400, Peter Hurley wrote:

> The linux-next tree has failed to build for last 7 days with these
> errors:

In some pretty specific and basically unrealistic configurations rather
than anything a human is likely to want to use or the core automatic
ones.

>   MODPOST 2490 modules
>   ERROR: "arizona_rate_text" [sound/soc/codecs/snd-soc-wm-adsp.ko] undefined!
>   ERROR: "arizona_rate_val" [sound/soc/codecs/snd-soc-wm-adsp.ko] undefined!
>   WARNING: modpost: Found 5 section mismatch(es).

> Patches submitted by Xiong Zhou <jencce.kernel@gmail.com> to fix this
> have been rejected.

> Until the author(s) resolve the situation, mark the offenders as BROKEN.

I'm not going to apply this, it's clearly not a constructive or helpful
effort to address the issue - it's not engaging with any of the
discussion about how to resolve the issue (there's no mention of the
suggested fix for example).

If you're going to run randconfigs that's great and the testing is
useful but if you're going to send patches as well as reports it would
be really helpful to look at what the code is doing so that the change
makes sense rather than just sending the first thing that springs to
mind.  The smarter the stuff that gets sent is the more likely it is to
either get merged or encourage people to work on the problem.

In this case it seems like Xiong is likely to fix things and it'd be
much better overall to get a fix from Xiong merged (which we seem to be
progressing towards).

--EUKSLY24k2f/9z8U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRVct2AAoJELSic+t+oim9nSgQAI0tq87S1SYBDMUNvZjh4uru
OoxJkXYSW0p2BTMRUI3rWg25AmDRXGy3bCz711Yq7phF4doX7mDXf5/ECypI7F4l
orOcrvUzU2uQnJEwZ0nds2deI8Ef0qiPjZVjqbh8bNbJmwyF1QcAyBkEi5XVWSnc
AVem+jXbuWyAnAdGVDL68yu4HptBV4TI26mfPvb6xYHpAVuawlP5UXEtEMCwHXuw
uU45d2Z98wCOetcU9sUPmcVV1Jq83/ouDokR+fHPtXVDXQ4HZYEhBq8utOsLnyVs
AIJqMc5MgtULzrD4dFTewdjV6YhpCmZO8y4A3Z91ZiX5XCg2CwltzfhlQlB0mRmz
jp/0DCWoDuWG2I64vli0Ujw+AhhG1ziSNvBTr1f9pIK/QJeIPu/FI71izpIsFwxZ
wJPWHfwqNvE67Ljr/HbysV+klouk3hGUKvAO2hqrkE6nevyIFsWHlVpq+ax2cr43
ctXlPPztm8AZ69mv9tN/ysd+Fm7t2EYF4b6bZO1UjaFUJQuLtAQ0Q5GwNgjF0Hn8
aLtcb7CipnAkIJ3WusR9LMpaX91MRWwuiEOrRcbG25D/cxSmeo6dyZKHuLSCWhdj
EP8q2d2E2OLZKZ7EClZVuBPrfhU+FccWUK8m8v6xvGJBSJqE39/90yJKRNeBt2PI
rStsGHZILt53hRK6/WgP
=05r6
-----END PGP SIGNATURE-----

--EUKSLY24k2f/9z8U--
