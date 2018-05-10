From: Chuck Lever <chuck.lever@oracle.com>
Subject: Re: linux-next: build warning after merge of the nfsd tree
Date: Thu, 10 May 2018 12:10:18 -0400
Message-ID: <401FFD11-BAF8-4C2E-8596-0BA734C8EDD5@oracle.com>
References: <20180510104213.31c41377@canb.auug.org.au>
 <4A03C3E8-6DBA-4FDA-A5C3-46D9E678FC02@oracle.com>
 <20180510152410.GB29678@fieldses.org>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180510152410.GB29678@fieldses.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bruce Fields <bfields@fieldses.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



> On May 10, 2018, at 11:24 AM, Bruce Fields <bfields@fieldses.org> =
wrote:
>=20
> On Thu, May 10, 2018 at 10:21:05AM -0400, Chuck Lever wrote:
>>=20
>>=20
>>> On May 9, 2018, at 8:42 PM, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>>>=20
>>> Hi all,
>>>=20
>>> After merging the nfsd tree, today's linux-next build (powerpc
>>> ppc64_defconfig) produced this warning:
>>>=20
>>> net/sunrpc/xprtrdma/svc_rdma_transport.c: In function =
'rdma_listen_handler':
>>> net/sunrpc/xprtrdma/svc_rdma_transport.c:299:23: warning: unused =
variable 'rdma' [-Wunused-variable]
>>> struct svcxprt_rdma *rdma =3D cma_id->context;
>>>                      ^~~~
>>=20
>> Needs to be wrapped with "#if IS_ENABLED(CONFIG_SUNRPC_DEBUG)"
>> Would you like me to send a patch?
>=20
> Any objection to saving the #if and just going back to writing out
> cma_id->context there?

LGTM

That's not really very useful information anyway, but I decided
to leave this stuff mostly as-is for now. I plan to do something
to fix races between disconnect and device removal at some point.


> I've done that in my tree.
>=20
> --b.
>=20
> diff --git a/net/sunrpc/xprtrdma/svc_rdma_transport.c =
b/net/sunrpc/xprtrdma/svc_rdma_transport.c
> index ca9001d73456..05edb18f8ca3 100644
> --- a/net/sunrpc/xprtrdma/svc_rdma_transport.c
> +++ b/net/sunrpc/xprtrdma/svc_rdma_transport.c
> @@ -544,7 +544,6 @@ static int rdma_listen_handler(struct rdma_cm_id =
*cma_id,
> 			       struct rdma_cm_event *event)
> {
> 	struct sockaddr *sap =3D (struct sockaddr =
*)&cma_id->route.addr.src_addr;
> -	struct svcxprt_rdma *rdma =3D cma_id->context;
> 	int ret =3D 0;
>=20
> 	trace_svcrdma_cm_event(event, sap);
> @@ -552,7 +551,7 @@ static int rdma_listen_handler(struct rdma_cm_id =
*cma_id,
> 	switch (event->event) {
> 	case RDMA_CM_EVENT_CONNECT_REQUEST:
> 		dprintk("svcrdma: Connect request on cma_id=3D%p, xprt =3D=
 %p, "
> -			"event =3D %s (%d)\n", cma_id, rdma,
> +			"event =3D %s (%d)\n", cma_id, cma_id->context,
> 			rdma_event_msg(event->event), event->event);
> 		handle_connect_req(cma_id, &event->param.conn);
> 		break;

--
Chuck Lever
