From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 01 Apr 2019 22:11:44 +1100
Message-ID: <87tvfiou8f.fsf@concordia.ellerman.id.au>
References: <20190326133349.3d9427dc@canb.auug.org.au> <20190326131550.GB10898@sirena.org.uk> <87pnqdndmk.fsf@concordia.ellerman.id.au> <20190327115745.GA11404@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190327115745.GA11404@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Annaliese McDermond <nh6z@nh6z.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org
List-Id: linux-next.vger.kernel.org

Mark Brown <broonie@kernel.org> writes:
> On Wed, Mar 27, 2019 at 03:29:55PM +1100, Michael Ellerman wrote:
>> Mark Brown <broonie@kernel.org> writes:
>
>> > Hrm, seems PowerPC is still not using the common clock API - is there
>> > any plan for that?  There are some ASoC PowerPC uses so it's going to be
>> > a bit of an issue as we expand our use of the clock API.
>
>> I don't know anything about the common clock API. What would it involve
>> for powerpc to use it?
>
> It's what's in drivers/clk - you'd have to provide clock drivers for all
> the clocks that are current supported by arch-specific code, make sure
> that those drivers can be instantiated and then remove the custom
> implementation of the clock API in arch/powerpc in favour of those.

OK. I realise we do have some support for the common clock API, but only
on certain sub-platforms (PPC_MPC512x, PPC_MPC52xx, PPC_E500MC).

On other platforms we have nothing at all AFAICS.

Seems Ben posted an RFC to support it in 2009, but nothing since:
  http://patchwork.ozlabs.org/patch/31551/


Anyway I think what you've done in next, make the code depend on
COMMON_CLOCK, is the best option. If anyone cares about that driver on
powerpc platforms that don't support COMMON_CLOCK they should speak up.

cheers
