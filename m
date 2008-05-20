From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: x86/cpufreq merge conflict
Date: Tue, 20 May 2008 15:28:04 +1000
Message-ID: <20080520152804.b357bded.sfr@canb.auug.org.au>
References: <20080519143927.e8b43d39.sfr@canb.auug.org.au>
	<20080519222604.GC20207@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__20_May_2008_15_28_04_+1000_Vr=HdT4M.oXzXiMi"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51951 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753738AbYETF2X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 May 2008 01:28:23 -0400
In-Reply-To: <20080519222604.GC20207@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

--Signature=_Tue__20_May_2008_15_28_04_+1000_Vr=HdT4M.oXzXiMi
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Mon, 19 May 2008 18:26:04 -0400 Dave Jones <davej@redhat.com> wrote:
>
> On Mon, May 19, 2008 at 02:39:27PM +1000, Stephen Rothwell wrote:
>  > Hi Dave, Ingo,
>  >=20
>  > Today's linux-next cpufreq merge got a conflict in
>  > drivers/cpufreq/cpufreq.c between commit
>  > fdbf6c63c1bd250d45a59a6392fa18ccb360837b ("x86: Use performance variant
>  > for_each_cpu_mask_nr") from the x86 tree and commit
>  > ae47c109341198f814767d2f06a1c1e4c7910fb9 ("[CPUFREQ] change cpu freq
>  > arrays to per_cpu variables") from the cpufreq tree.  The conflict is
>  > just contextual with the former changing for_each_cpu_mask to
>  > for_each_cpu_mask_nr in a couple of places right next to the latter
>  > changing "cpufreq_cpu_data[j]" to "per_cpu(cpufreq_cpu_data, j)".
>=20
> ok, so how do we deal with this? Either Ingo or myself will have
> to fix it up depending on whoever merges into .27 first I guess,
> but in the interim, you'll have to carry that diff ?
> Or should one of us drop a diff, and merge both through the other tree?

This conflict appears to have vanished today.  So something changed in
your tree or Ingo's tree.

Normally trivial conflicts like this I can just carry. If they occur
for Linus (when your code goes upstream) he can just fix them up as well.
Also "git rerere" remembers the conflict fix for me and just applies it
again if the conflict reappears.

> btw, I've just slightly changed my workflow for the cpufreq.git tree.
> >From now on, pull from the 'next' branch.   master will be untouched,
> and 'fixes' will be stuff that will go to linus v. soon in the current cy=
cle.

I have updated for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__20_May_2008_15_28_04_+1000_Vr=HdT4M.oXzXiMi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMmFxTgG2atn1QN8RAuhmAJ0aaTY/+g7EVYxVUvSGZXQWcBnu2gCfanqo
z2QyiyYzNYyPjTu0pQzpFXs=
=Ied/
-----END PGP SIGNATURE-----

--Signature=_Tue__20_May_2008_15_28_04_+1000_Vr=HdT4M.oXzXiMi--
