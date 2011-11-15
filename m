From: "Williams, Dan J" <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge of the pm tree (and warning)
Date: Mon, 14 Nov 2011 18:52:27 -0800
Message-ID: <CABE8wwsSwDDoBdAUkUggxTJAQd=xErRL=ryQojGePJGTMj5B6A@mail.gmail.com>
References: <20111114131730.ae09bb18b87e67f61a97275e@canb.auug.org.au>
	<201111150014.50898.rjw@sisk.pl>
	<Pine.LNX.4.64.1111150032170.32143@axis700.grange>
	<20111114233957.GF30922@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111114233957.GF30922@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: linux-next.vger.kernel.org

[ sorry I've been out of town... ]

On Mon, Nov 14, 2011 at 3:39 PM, Tejun Heo <tj@kernel.org> wrote:
> Hello, Guennadi.
>
> On Tue, Nov 15, 2011 at 12:33:29AM +0100, Guennadi Liakhovetski wrote=
:
>> No, this isn't a correct fix.
>
> I've been looking at the code and am scratching my head about what
> happens after timeout. =A0If test timed out (tmo =3D=3D 0), it prints=
 out
> error message and continues to the next iteration of the test loop,
> which will reinitialize the on-stack completion. =A0This essentially
> makes the previous test run's callback_param pointer dangling. =A0The
> completion needs to be either detached from the callback or waited
> upon even if it timed out. =A0Am I missing something?

If the completion times out then it is almost certainly a hardware or
driver bug.  There is no facility to get a dma driver to forget a
queued operation.  The test should probably abort at that point, but
it isn't intended to be a recoverable condition.

--
Dan
