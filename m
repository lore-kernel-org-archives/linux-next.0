From: Rob Lee <rob.lee@linaro.org>
Subject: Re: [PATCH] cpuidle : fix random hangs with intel_idle
Date: Tue, 20 Mar 2012 11:27:47 -0500
Message-ID: <CAMXH7KH5HWyQwombjDYXHsPanHBHU5h69X7r9k2gFhy5p6JqnQ@mail.gmail.com>
References: <alpine.LSU.2.00.1203131454500.1335@eggly.anvils>
	<1331770181-800-1-git-send-email-daniel.lezcano@linaro.org>
	<20120315111415.cd119171ac86967aebe85545@canb.auug.org.au>
	<alpine.LSU.2.00.1203141720360.2003@eggly.anvils>
	<20120315135841.affff2d75681451d9ddd1a58@canb.auug.org.au>
	<CAHLCerOeSHvFXb9ZnBDc1RjETbMLoMNYWqtrM=ipp_iX9XZ1cQ@mail.gmail.com>
	<20120317012628.4239343e48d748af2514b5b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120317012628.4239343e48d748af2514b5b2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Amit Kucheria <amit.kucheria@linaro.org>, Hugh Dickins <hughd@google.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, akpm@linux-foundation.org, j-pihet@ti.com, khilman@ti.com, deepthi@linux.vnet.ibm.com, dan.carpenter@oracle.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hello Stephen,

I am back in town and have reviewed and applied Daniel's fix to my
tree.  Also, I updated my tree to v3.3.

git://git.linaro.org/people/rob_lee/linux.git cpuidle_consol_pull

Daniel, thank you for investigating and providing the fix in my absence=
=2E

Best Regards,
Rob


On Fri, Mar 16, 2012 at 9:26 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Amit,
>
> On Fri, 16 Mar 2012 15:37:07 +0200 Amit Kucheria <amit.kucheria@linar=
o.org> wrote:
>>
>> A slight glitch: Rob is away until Tuesday. Should Daniel create a n=
ew
>> branch to carry this?
>
> I can keep applying it to linux-next, it just needs to be added to Ro=
b's
> tree before Linus is asked to merge it.
>
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
