From: Chuck Lever <chuck.lever@oracle.com>
Subject: Re: linux-next: build warning after merge of the nfsd tree
Date: Thu, 10 May 2018 10:21:05 -0400
Message-ID: <4A03C3E8-6DBA-4FDA-A5C3-46D9E678FC02@oracle.com>
References: <20180510104213.31c41377@canb.auug.org.au>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180510104213.31c41377@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bruce Fields <bfields@fieldses.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



> On May 9, 2018, at 8:42 PM, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Hi all,
>=20
> After merging the nfsd tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>=20
> net/sunrpc/xprtrdma/svc_rdma_transport.c: In function =
'rdma_listen_handler':
> net/sunrpc/xprtrdma/svc_rdma_transport.c:299:23: warning: unused =
variable 'rdma' [-Wunused-variable]
>  struct svcxprt_rdma *rdma =3D cma_id->context;
>                       ^~~~

Needs to be wrapped with "#if IS_ENABLED(CONFIG_SUNRPC_DEBUG)"
Would you like me to send a patch?


> Introduced by commit
>=20
>  d1ab72afe681 ("svcrdma: Trace key RDMA API events")

--
Chuck Lever
