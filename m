From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pm tree
Date: Wed, 28 Sep 2011 14:51:44 +1000
Message-ID: <20110928145144.3d074db9aa9b6f858e0dc4fb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__28_Sep_2011_14_51_44_+1000_tlSFUvJ2w+W207G5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:59810 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751731Ab1I1Evv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Sep 2011 00:51:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ming Lei <ming.lei@canonical.com>

--Signature=_Wed__28_Sep_2011_14_51_44_+1000_tlSFUvJ2w+W207G5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

After merging the pm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/trace/ftrace.h:567:0,
                 from include/trace/define_trace.h:96,
                 from include/trace/events/rpm.h:99,
                 from kernel/trace/rpm-traces.c:15:
include/trace/events/rpm.h: In function 'ftrace_raw_event_rpm_internal':
include/trace/events/rpm.h:16:1: error: 'struct dev_pm_info' has no member =
named 'usage_count'
include/trace/events/rpm.h:16:1: error: 'struct dev_pm_info' has no member =
named 'disable_depth'
include/trace/events/rpm.h:16:1: error: 'struct dev_pm_info' has no member =
named 'runtime_auto'
include/trace/events/rpm.h:16:1: error: 'struct dev_pm_info' has no member =
named 'request_pending'
include/trace/events/rpm.h:16:1: error: 'struct dev_pm_info' has no member =
named 'irq_safe'
include/trace/events/rpm.h:16:1: error: 'struct dev_pm_info' has no member =
named 'child_count'
In file included from include/trace/ftrace.h:771:0,
                 from include/trace/define_trace.h:96,
                 from include/trace/events/rpm.h:99,
                 from kernel/trace/rpm-traces.c:15:
include/trace/events/rpm.h: In function 'perf_trace_rpm_internal':
include/trace/events/rpm.h:16:1: error: 'struct dev_pm_info' has no member =
named 'usage_count'
include/trace/events/rpm.h:16:1: error: 'struct dev_pm_info' has no member =
named 'disable_depth'
include/trace/events/rpm.h:16:1: error: 'struct dev_pm_info' has no member =
named 'runtime_auto'
include/trace/events/rpm.h:16:1: error: 'struct dev_pm_info' has no member =
named 'request_pending'
include/trace/events/rpm.h:16:1: error: 'struct dev_pm_info' has no member =
named 'irq_safe'
include/trace/events/rpm.h:16:1: error: 'struct dev_pm_info' has no member =
named 'child_count'

Presumably caused by commit 53b615ccca56 ("PM / Runtime: Introduce trace
points for tracing rpm_* functions").

I have used the pm tree from next-20110927 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__28_Sep_2011_14_51_44_+1000_tlSFUvJ2w+W207G5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOgqfgAAoJEDMEi1NhKgbsjs8H/2/2jdrSCNdkuCwTWHUyRHGG
CagjDNpNaXiV/oUGxD32em4AixQXbLYTWJYQ/4SlxB7FvgH5ZYcojOw3Lwq2V/Oo
swJXv9CzJCrc8yNuieOKpizEnIZ6YPxL9Tv4RUBo1Re5KKC0PQr4ms8VMNjAM1r9
cS0oNlWB5dgjOfMTlgOwFvwGj3nO1UK1+mLdEQr7ERnUezkrfiVJCyfYX7i3DGV+
pf7V4fgg3R2kROYfyCMON/icMxj6UGW80oPI6P32Y/NAJMyohowW/JQxuVM3j7PT
5sWrrdtAn6wz+6Camuk3dhRWo/jsfNJ/5cwCUM/kPUPFlIFAV82pmwN3laAU4rM=
=lZmb
-----END PGP SIGNATURE-----

--Signature=_Wed__28_Sep_2011_14_51_44_+1000_tlSFUvJ2w+W207G5--
