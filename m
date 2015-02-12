From: Trond Myklebust <trond.myklebust@primarydata.com>
Subject: Re: randconfig build error with next-20150209, in fs/nfs/client.c
Date: Thu, 12 Feb 2015 08:35:02 -0500
Message-ID: <1423748102.4004.2.camel@primarydata.com>
References: <CA+r1ZhinMg425ecr4F_XqhRUyCs1FOMDBjvVvf0jV_O-WmpcgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:64233 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754982AbbBLNfF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Feb 2015 08:35:05 -0500
Received: by mail-ig0-f178.google.com with SMTP id hl2so3619678igb.5
        for <linux-next@vger.kernel.org>; Thu, 12 Feb 2015 05:35:04 -0800 (PST)
In-Reply-To: <CA+r1ZhinMg425ecr4F_XqhRUyCs1FOMDBjvVvf0jV_O-WmpcgA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>, Thomas D Haynes <thomas.haynes@primarydata.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, anna.schumaker@netapp.com, linux-nfs@vger.kernel.org

On Mon, 2015-02-09 at 11:00 -0700, Jim Davis wrote:
> Building with the attached random configuration file,
>=20
> In file included from fs/nfs/client.c:25:0:
> include/linux/sunrpc/metrics.h: In function =E2=80=98rpc_count_iostat=
s_metrics=E2=80=99:
> include/linux/sunrpc/metrics.h:92:59: error: parameter name omitted
>  static inline void rpc_count_iostats_metrics(const struct rpc_task *=
,
>                                                            ^
> include/linux/sunrpc/metrics.h:93:18: error: parameter name omitted
>            struct rpc_iostats *) {}
>                   ^
>   CC      net/ipv4/ip_vti.o
>   CC      net/ipv6/addrconf_core.o
> make[2]: *** [fs/nfs/client.o] Error 1

Thanks for the report! I'm adding the following fix to my linux-next
branch and will push it to Linus before the merge window ends.

8<------------------------------------------------------------------
=46rom 54d7e72a758609da5936d7452320d799cfc6a25c Mon Sep 17 00:00:00 200=
1
=46rom: Trond Myklebust <trond.myklebust@primarydata.com>
Date: Thu, 12 Feb 2015 08:28:12 -0500
Subject: [PATCH] SUNRPC: Fix a compile error when #undef CONFIG_PROC_FS

The definition of rpc_count_iostats_metrics() is borked.

Reported by: Jim Davis <jim.epost@gmail.com>
=46ixes: d67ae825a59d6 ("pnfs/flexfiles: Add the FlexFile Layout Driver=
")
Cc: Tom Haynes <thomas.haynes@primarydata.com>
Signed-off-by: Trond Myklebust <trond.myklebust@primarydata.com>
---
 include/linux/sunrpc/metrics.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/sunrpc/metrics.h b/include/linux/sunrpc/metr=
ics.h
index 7e61a17030a4..694eecb2f1b5 100644
--- a/include/linux/sunrpc/metrics.h
+++ b/include/linux/sunrpc/metrics.h
@@ -89,8 +89,11 @@ void			rpc_free_iostats(struct rpc_iostats *);
 static inline struct rpc_iostats *rpc_alloc_iostats(struct rpc_clnt *c=
lnt) { return NULL; }
 static inline void rpc_count_iostats(const struct rpc_task *task,
 				     struct rpc_iostats *stats) {}
-static inline void rpc_count_iostats_metrics(const struct rpc_task *,
-					     struct rpc_iostats *) {}
+static inline void rpc_count_iostats_metrics(const struct rpc_task *ta=
sk,
+					     struct rpc_iostats *stats)
+{
+}
+
 static inline void rpc_print_iostats(struct seq_file *seq, struct rpc_=
clnt *clnt) {}
 static inline void rpc_free_iostats(struct rpc_iostats *stats) {}
=20
--=20
2.1.0


--=20
Trond Myklebust
Linux NFS client maintainer, PrimaryData
trond.myklebust@primarydata.com
