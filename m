From: Valdis.Kletnieks@vt.edu
Subject: Re: mmotm 2016-10-27-18-27 uploaded
Date: Mon, 31 Oct 2016 16:37:50 -0400
Message-ID: <21418.1477946270@turing-police.cc.vt.edu>
References: <5812a9b6.OlAMBhewokz9/Mou%akpm@linux-foundation.org>
 <CAP=VYLqNv8p_ojkcjeWCN-nMumDg296UkV1b460KDHAXOHZSEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1477946270_20678P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <CAP=VYLqNv8p_ojkcjeWCN-nMumDg296UkV1b460KDHAXOHZSEA@mail.gmail.com>
Sender: owner-linux-mm@kvack.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, mm-commits@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Michal Hocko <mhocko@suse.cz>, broonie@kernel.org
List-Id: linux-next.vger.kernel.org

--==_Exmh_1477946270_20678P
Content-Type: text/plain; charset=us-ascii

On Sun, 30 Oct 2016 14:15:30 -0400, Paul Gortmaker said:
> On Thu, Oct 27, 2016 at 9:28 PM,  <akpm@linux-foundation.org> wrote:
> > The mm-of-the-moment snapshot 2016-10-27-18-27 has been uploaded to
> >
> >    http://www.ozlabs.org/~akpm/mmotm/
>
> Just a heads up:
>
> Somehow one of the akpm commits as it appears in linux-next has had
> spaces replaced with garbage chars:
>
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/scripts/get_maintainer.pl?id=b67071653d3fc9f9b73aab3e7978f060728bf392

How... special.  They're 0xA0 non-breaking-space chars.  Somebody's
editor was obviously in the wrong mode. :)



--==_Exmh_1477946270_20678P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.5 07/13/2001

iQEVAwUBWBerno0DS38y7CIcAQLP2Qf+NdAaDANAToJLVajkwVYVDGOxMb8pwJBN
1gowWGHDALNepgrYZXAp/SL6zwc7DTScE6RXbj0hiv0aMXsENXcB2DP9et/HX1st
PB2BPOjVCLhjL6vNW57WOlUlb4YgGdwoE7Ba06sJH/YbAGLCnwxYuhoz4e6bwHFU
BkXDCbdZRVE3xstXpM0ZBJrZ1tiZW6dQ4RXb12pHhlrBHIDtdnhksvOFgz9CemxY
PWRQS4vZbWAQza6g89H6f3QZEBc1A82K1RtV7gtObrwrpQhZvKpxXOYpwx9yg2pP
Md5jjbmye4yBsFLsap7jH0Z37gyAaFBKFAJapVnv/b75p2gFc1sgCg==
=XuS+
-----END PGP SIGNATURE-----

--==_Exmh_1477946270_20678P--

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
