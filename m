From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: percpu tree build failure
Date: Tue, 13 Oct 2009 14:48:12 +1100
Message-ID: <20091013144812.bdb376aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__13_Oct_2009_14_48_12_+1100_3xisOSqDA8LiiuK9"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758934AbZJMDs5@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__13_Oct_2009_14_48_12_+1100_3xisOSqDA8LiiuK9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

kernel/trace/trace_functions_graph.c: In function '__trace_graph_entry':
kernel/trace/trace_functions_graph.c:179: error: request for member 'a' in =
something not a structure or union
kernel/trace/trace_functions_graph.c: In function '__trace_graph_return':
kernel/trace/trace_functions_graph.c:243: error: request for member 'a' in =
something not a structure or union

Caused by commit 9288f99aa52d90a5b82573c4b769c97c55af2f56 ("this_cpu: Use
this_cpu_xx for ftrace").

I have used the version of the percpu tree from next-20091012 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__13_Oct_2009_14_48_12_+1100_3xisOSqDA8LiiuK9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrT+HwACgkQjjKRsyhoI8w0NwCfYFaEOXdXpoPJpfO0kIpgh/35
4tcAni7y7IaqRfWpnjGxzlS/yRioRcZE
=GjyN
-----END PGP SIGNATURE-----

--Signature=_Tue__13_Oct_2009_14_48_12_+1100_3xisOSqDA8LiiuK9--
