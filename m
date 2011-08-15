From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (xfs tree
 related)
Date: Mon, 15 Aug 2011 16:10:23 +1000
Message-ID: <20110815161023.6227665ab11f8a35fd649e3a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__15_Aug_2011_16_10_23_+1000_d8gyt/8d4vZIP4DK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53167 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752504Ab1HOGKd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Aug 2011 02:10:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Elder <aelder@sgi.com>, Christoph Hellwig <hch@infradead.org>

--Signature=_Mon__15_Aug_2011_16_10_23_+1000_d8gyt/8d4vZIP4DK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (a powerpc server
config) failed like this:

In file included from fs/xfs/xfs_trace.h:1746,
                 from fs/xfs/xfs_trace.c:56:
include/trace/define_trace.h:89:43: error: ./xfs_trace.h: No such file or d=
irectory

Probably caused by commit c59d87c46076 ("xfs: remove subdirectories").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__15_Aug_2011_16_10_23_+1000_d8gyt/8d4vZIP4DK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOSLhPAAoJEDMEi1NhKgbsa2sH/1dBDyKvuS1VPLTFo5hdzwcX
r9BhGm1ZUDCgpfjcu7pUPopMasBTO1PFxD7zJ8xuXMo+GOBrmzg4TPz0yWPbG/rc
QXv1khMAzhRZbRWPfSX5Es/Ck7uHX/MgZJX8fTJnWnTKbx5GXTcDWg/971hKD0fj
UodbGQwb/6daYSjCVZkxOJrcERfOvg+E5OXdz9TjM+/MKhMPua9sViROOYlbem3T
q1ktCtXiMRz8TeEsHKK+msq9a4TD+efimqLo9vGw2Ov8MbUiOzcXZjtWLAO7jYjf
/UUdF4Xkuxd15x/elLGmjH27uliZtHl6nsVECRzNj+QnTOKqVsT6FkPWQlb8m0s=
=wlg8
-----END PGP SIGNATURE-----

--Signature=_Mon__15_Aug_2011_16_10_23_+1000_d8gyt/8d4vZIP4DK--
