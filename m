From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the tip tree
Date: Mon, 17 Dec 2018 10:42:47 +1100
Message-ID: <20181217104247.26549a16@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XCS2Nje.p44kZ2wwKL5rGSJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, Jiri Olsa <jolsa@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/XCS2Nje.p44kZ2wwKL5rGSJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  5a0cb2ffce06 ("perf ordered_events: Add first_time() method")

is missing a Signed-off-by from its author.

Commits

  a1dcb76e592a ("perf top: Move perf_top__reset_sample_counters() to after =
counts display")
  ffec48b73449 ("perf top: Display slow reader warning when droping samples=
")
  30eacd0f6c56 ("perf top: Save and display the drop count stats")
  bdbc7bcf0f9a ("perf top: Drop samples which are behind the refresh rate")
  2e86f646dd68 ("perf top: Set the 'session_done' volatile variable when ex=
iting")
  bc67057cab13 ("perf top: Use cond variable instead of a lock")
  73df315a5120 ("perf top: Add processing thread")
  f0a93bdc13e4 ("perf top: Move lost events warning to helpline")
  f03b87dd0b44 ("perf top: Save and display the lost count stats")
  4bc8acb7e06b ("perf ordered_events: Add private data member")
  52ea6a5168fb ("perf ordered_events: Rework show_progress for __ordered_ev=
ents__flush")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/XCS2Nje.p44kZ2wwKL5rGSJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwW4vcACgkQAVBC80lX
0GwD3Qf+IWmywzDEtcSTYYRRQjkJtfpz/WxgN5Kv1rBUx+BR43o6IDkHUiWl77D/
6Cpz9MivIYu8wJ6JxrX9njXiI3oHcGXNjpCItwpM7L5J6mdYY3l1idD6P6FRvg6b
K6k8ZVvIOaBKiNN4dl7sBq1RggAudn2jiiAv1SOE0uYBxUXGtAJ0eUBiBXuWj+Um
kmt5W32qR7I11zoODQVMmlDQ2UYGVdSkeLi85JODp9YBmgqXGeUfachG83uyJI1G
G+AbRccI4K1gMy4WGuzobXQRQbzYPzqZWxb4EHNCQQ9TCZTdK/AxR75u7eUxHrcR
Oayh+Ffp9cxH5F67Zc9PWPFeHV15uA==
=3/nj
-----END PGP SIGNATURE-----

--Sig_/XCS2Nje.p44kZ2wwKL5rGSJ--
