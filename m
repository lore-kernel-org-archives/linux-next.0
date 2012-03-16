From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH] cpuidle : fix random hangs with intel_idle
Date: Fri, 16 Mar 2012 15:37:07 +0200
Message-ID: <CAHLCerOeSHvFXb9ZnBDc1RjETbMLoMNYWqtrM=ipp_iX9XZ1cQ@mail.gmail.com>
References: <alpine.LSU.2.00.1203131454500.1335@eggly.anvils>
	<1331770181-800-1-git-send-email-daniel.lezcano@linaro.org>
	<20120315111415.cd119171ac86967aebe85545@canb.auug.org.au>
	<alpine.LSU.2.00.1203141720360.2003@eggly.anvils>
	<20120315135841.affff2d75681451d9ddd1a58@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120315135841.affff2d75681451d9ddd1a58@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Hugh Dickins <hughd@google.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, akpm@linux-foundation.org, rob.lee@linaro.org, j-pihet@ti.com, khilman@ti.com, deepthi@linux.vnet.ibm.com, dan.carpenter@oracle.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Mar 15, 2012 at 4:58 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Hugh,
>
> On Wed, 14 Mar 2012 17:23:26 -0700 (PDT) Hugh Dickins <hughd@google.c=
om> wrote:
>>
>> On Thu, 15 Mar 2012, Stephen Rothwell wrote:
>> >
>> > So this needs to go into Rob's tree. =A0Maybe after Hugh verifies =
that it
>> > fixes his problem.
>>
>> Yes, Daniel got me to try it offline before he posted it.
>>
>> Tested-by: Hugh Dickins <hughd@google.com>
>
> Excellent.
>
>> Personally, I'd recommend including it even before it gets into Rob'=
s
>> tree (where it may well be improved upon first): it does a lot to
>> improve the usability of linux-next.
>
> OK, so I will add this patch to today's tree (on the assumption that =
it,
> or something better, will be added to Rob's tree soon).

Stephen,

A slight glitch: Rob is away until Tuesday. Should Daniel create a new
branch to carry this?

/Amit
