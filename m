From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the char-misc tree
Date: Mon, 13 Apr 2015 19:37:20 +1000
Message-ID: <20150413193720.56083fbf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dUA5iozU7tptDW2vJdpi/8t"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51458 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752843AbbDMJh2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 05:37:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>

--Sig_/dUA5iozU7tptDW2vJdpi/8t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

In file included from include/trace/define_trace.h:90:0,
                 from drivers/misc/mei/mei-trace.h:76,
                 from drivers/misc/mei/mei-trace.c:21:
include/trace/ftrace.h:28:0: warning: "TRACE_SYSTEM_STRING" redefined
 #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
 ^
In file included from include/trace/define_trace.h:83:0,
                 from drivers/misc/mei/mei-trace.h:76,
                 from drivers/misc/mei/mei-trace.c:21:
drivers/misc/mei/./mei-trace.h:29:0: note: this is the location of the prev=
ious definition
 #define TRACE_SYSTEM_STRING __stringify(TRACE_SYSTEM)
 ^
In file included from include/trace/ftrace.h:134:0,
                 from include/trace/define_trace.h:90,
                 from drivers/misc/mei/mei-trace.h:76,
                 from drivers/misc/mei/mei-trace.c:21:
drivers/misc/mei/./mei-trace.h:29:0: warning: "TRACE_SYSTEM_STRING" redefin=
ed
 #define TRACE_SYSTEM_STRING __stringify(TRACE_SYSTEM)
 ^
In file included from include/trace/define_trace.h:90:0,
                 from drivers/misc/mei/mei-trace.h:76,
                 from drivers/misc/mei/mei-trace.c:21:
include/trace/ftrace.h:28:0: note: this is the location of the previous def=
inition
 #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
 ^
In file included from include/trace/define_trace.h:90:0,
                 from drivers/misc/mei/mei-trace.h:76,
                 from drivers/misc/mei/mei-trace.c:21:
include/trace/ftrace.h:28:0: warning: "TRACE_SYSTEM_STRING" redefined
 #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
 ^
In file included from include/trace/define_trace.h:83:0,
                 from drivers/misc/mei/mei-trace.h:76,
                 from drivers/misc/mei/mei-trace.c:21:
drivers/misc/mei/./mei-trace.h:29:0: note: this is the location of the prev=
ious definition
 #define TRACE_SYSTEM_STRING __stringify(TRACE_SYSTEM)
 ^
In file included from include/trace/ftrace.h:134:0,
                 from include/trace/define_trace.h:90,
                 from drivers/misc/mei/mei-trace.h:76,
                 from drivers/misc/mei/mei-trace.c:21:
drivers/misc/mei/./mei-trace.h:29:0: warning: "TRACE_SYSTEM_STRING" redefin=
ed
 #define TRACE_SYSTEM_STRING __stringify(TRACE_SYSTEM)
 ^
In file included from include/trace/define_trace.h:90:0,
                 from drivers/misc/mei/mei-trace.h:76,
                 from drivers/misc/mei/mei-trace.c:21:
include/trace/ftrace.h:28:0: note: this is the location of the previous def=
inition
 #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
 ^

Introduced by commit a0a927d06d79 ("mei: me: add io register tracing")
interacting with commit acd388fd3af3 ("tracing: Give system name a
pointer") from the ftrace tree.

TRACE_SYSTEM_STRING should be removed from drivers/misc/mei/mei-trace.h
as it is not being used anywhere in the mei-trace code.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/dUA5iozU7tptDW2vJdpi/8t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVK45UAAoJEMDTa8Ir7ZwV+kEP/14/mqIJOcCtMLwvBPKrTnQK
bgQqcTLrPXGWG4wtcOc0CT/e76FQBoXEqgvyoQK8k3u6Eyv+e1BsCOvxuE/Olww7
PkLXdXyK4I2PKjP56yc1z+PAYG2Ip8ab2OcG6PB0UqfTfGz9PNQH5aCQTEZviHmg
ExQ3kRTK/O7JO67PLa9Y9ruv1wRwsVazz0ATwOKExIwR7nCEmGcDk7Pu1VKCHSxc
kKfi2+A+r26cqlbWQ22er7YZxCOD4nfleTGeYfWCzKO1d4I/S5FEDRJIuYGmYWnb
IwlmtGWt/+tu+LXite4a72FznqLW32rnvFYAeQVkb1psKxH6cS4fexw1LhTKTPt0
l9EaRxP8p/JibzW7lp+0NEpP2yuxIk+fIwjzjjg6peeQ6yZ64ucR6BsuOjFrYBzm
kSK8K7hU2nbm7fMCyB9gylUCh+HDXtVlpW2hP0vzMQGezUudoSpIMMepNjQgRwK+
ZToTTJ133RZp1E4ooVZPPcOLS2dSBnhnl/CY4ar5Dyx+Cdbdy6Xt/eUngfYAvElc
n8SpWt2SMVZpOlIYaOKk1sqPsX9rj/Ipre8fjhNKZVjH26adAS9zVlCh6FBRpOhr
dlqmd7vNlNgOCPY43o7CdyQaqCjCWss+wea2/6BZnT+zm1sO89Bre1BVOWSKA7n3
UlIiLJeKidLkw0jqmmsf
=o3CI
-----END PGP SIGNATURE-----

--Sig_/dUA5iozU7tptDW2vJdpi/8t--
