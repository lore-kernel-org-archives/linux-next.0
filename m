From: NeilBrown <neilb@suse.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Thu, 20 Apr 2017 12:17:19 +1000
Message-ID: <87pog7stzk.fsf@notabene.neil.brown.name>
References: <20170412164606.08578271@canb.auug.org.au> <bd7abc05-da24-8c65-c93e-ec30fe582233@suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43274 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S965007AbdDTCRa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Apr 2017 22:17:30 -0400
In-Reply-To: <bd7abc05-da24-8c65-c93e-ec30fe582233@suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12 2017, Vlastimil Babka wrote:

> On 12.4.2017 8:46, Stephen Rothwell wrote:
>> Hi Andrew,
>>=20
>> Today's linux-next merge of the akpm-current tree got conflicts in:
>>=20
>>   drivers/block/nbd.c
>>   drivers/scsi/iscsi_tcp.c
>>   net/core/dev.c
>>   net/core/sock.c
>>=20
>> between commit:
>>=20
>>   717a94b5fc70 ("sched/core: Remove 'task' parameter and rename tsk_rest=
ore_flags() to current_restore_flags()")
>>=20
>> from the tip tree and commit:
>>=20
>>   61d5ad5b2e8a ("treewide: convert PF_MEMALLOC manipulations to new help=
ers")
>>=20
>> from the akpm-current tree.
>
> Yeah, the first patch from Neil renames a function (as its subject says) =
and the
> second patch from me converts most of its users to new helpers specific t=
o the
> PF_MEMALLOC flags.
>
>> I fixed it up (the latter is just a superset of the former, so I used
>
> It's not a complete superset though, more on that below.
>
>> that) and can carry the fix as necessary. This is now fixed as far as
>> linux-next is concerned, but any non trivial conflicts should be mention=
ed
>> to your upstream maintainer when your tree is submitted for merging.
>> You may also want to consider cooperating with the maintainer of the
>> conflicting tree to minimise any particularly complex conflicts.
>
> Hmm I could redo my patch on top of Neil's patch, but then Andrew would h=
ave to
> carry Neil's patch as well just to have a working mmotm? And then make su=
re to
> send my patch (but not Neil's) only after the tip tree is pulled? Would t=
hat
> work for the maintainers involved?
>
>> It looks like there may be more instances that the latter patch should
>> update.
>
> I see two remaining instances of current_restore_flags(). One in __do_sof=
tirq()
> is even for PF_MEMALLOC, but there the flag is cleared first and then set=
 back,
> which is opposite of the common case that my helpers provide. The other i=
n nfsd
> is for PF_LESS_THROTTLE which is not common enough to earn own helpers ye=
t. IIRC
> Neil originally wanted to add a new one?

[Sorry - I thought I had sent this last week, but just noticed that I didn'=
t]

In general, I'm not a fan of overly-specific helpers.

As a general rule, tsk_restore_flags() is probably better than
current_restore_flags() as it is more general.
However in this specific case, using any task other than 'current' would
almost certainly be incorrect code as locking is impossible.  So I
prefer the 'current' to be implicit, but the actual flag to be explicit.

If you are going to add helpers for setting/clearing PF flags, I would
much rather that you take

#define current_test_flags(f)   (current->flags & (f))
#define current_set_flags_nested(sp, f)         \
                (*(sp) =3D current->flags, current->flags |=3D (f))
#define current_clear_flags_nested(sp, f)       \
                (*(sp) =3D current->flags, current->flags &=3D ~(f))
#define current_restore_flags_nested(sp, f)     \
                (current->flags =3D ((current->flags & ~(f)) | (*(sp) & (f)=
)))

out of fs/xfs/xfs_linux.h and use them globally.

Your
  noreclaim_flag =3D memalloc_reclaim_save()
becomes
  current_set_flags_nested&noreclaim_flag, PF_MEMALLOC)
which is more typing, but arguably easier to read.

If you then changed all uses of tsk_restore_flags() to use
current_restore_flags_nested(), my patch could be discarded as
irrelevant.

Thanks,
NeilBrown

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlj4Gi8ACgkQOeye3VZi
gbkENQ/9HvIJf4q9SYIQsIM0x8dxYi9vYZRC22t+PpcrZQHuv2+mqa9nB93EAbUY
cwdIgQd0tAKlFR2cYPVP0mblJjAeL5jy3NnIOjt1iEA4S86mN0uWKg4KiHGof5Jd
LMIin4qQkEVIq/YqaqZnhppAjMfl5EH8TWSfEcCH/urB9dRga3CeO9sJwXa+UxyP
huxvFv4sO/aHSw4hQixw/Eh8xLWtiOoWNiitdMiCgk+kx0dVdXpcPBQYuz4l43st
V84GJ7u1qzWaXf2MLj05WRhCUyStwTv26DMq0J2xXjZu+iEo7OCZQXDFrcF7T1LZ
6VtRsNBVGecc93MqQUCHFvHTnuttHIKEX/5TzcyVsz2+PfADlFUUwkrBoSmBk6Wg
dTS3KTwyiN9vK6L/cU46pClE5O/OEbEuiSgqb91KfvQZmr9TLiP7I35B9f0qSCo3
pyNIVEjg6+0xbZv/V2tPuLqWATIQPwyOgONyHPIlRKedI7GGkSstTqvlNA/5+HuC
gutfudJHZ7zr0R58zKiPw4GbcZ3SeXiRWfcqq0Df+sUdj9NzGcVrlXs46BM4a93o
qQ8xLtkOPgNerafgdqjJXE4Fp0JODbC3/FXIFRZTDsEaKWBbA/IQO8+hb4kob+xh
kdWpkeE5Iy4uc7Won5pGiIi+OTyedzRXuKmcvwnOUJbeXnedUIA=
=ueJO
-----END PGP SIGNATURE-----
--=-=-=--
