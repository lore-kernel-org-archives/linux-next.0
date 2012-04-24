From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next: clean up time
Date: Tue, 24 Apr 2012 15:01:46 -0700
Message-ID: <4F9722CA.80403@goop.org>
References: <20120402112009.3477dad7deff0f4d87f49b29@canb.auug.org.au> <20120423164859.082b5c53b5d9bd9a524ec864@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120423164859.082b5c53b5d9bd9a524ec864@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ben Dooks <ben-linux@fluff.org>, Xen Devel <Xen-devel@lists.xensource.com>, Sumit Semwal <sumit.semwal@linaro.org>, Rob Lee <rob.lee@linaro.org>
List-Id: linux-next.vger.kernel.org

On 04/22/2012 11:48 PM, Stephen Rothwell wrote:
> Hi all,
>
> On Mon, 2 Apr 2012 11:20:09 +1000 Stephen Rothwell
<sfr@canb.auug.org.au> wrote:
>>
>> Can people please clean up stuff in their trees that has been merged by
>> their upstream. This is especially useful where the upstream merged (or
>> applied) a slightly different version of their tree.
>
> There is still much cruft in the linux-next included trees ... The
> following trees appear empty (relative to Linus' tree) but cause conflicts:
>
> bjdooks-i2c
> xen
> dma-buf
> cpuidle-cons

Are you pulling from xen.git upstream/xen?  I just updated it to be
current Linus master, so it shouldn't conflict any more.

Thanks,
    J
