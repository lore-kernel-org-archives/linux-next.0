From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 27 Mar 2019 15:29:55 +1100
Message-ID: <87pnqdndmk.fsf@concordia.ellerman.id.au>
References: <20190326133349.3d9427dc@canb.auug.org.au> <20190326131550.GB10898@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190326131550.GB10898@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Annaliese McDermond <nh6z@nh6z.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org
List-Id: linux-next.vger.kernel.org

Mark Brown <broonie@kernel.org> writes:
> On Tue, Mar 26, 2019 at 01:33:49PM +1100, Stephen Rothwell wrote:
>
>> After merging the sound-asoc tree, today's linux-next build (powerpc
>> allyesconfig) failed like this:
>
>> sound/soc/codecs/tlv320aic32x4-clk.c: In function 'clk_aic32x4_pll_prepare':
>> include/linux/kernel.h:979:32: error: dereferencing pointer to incomplete type 'struct clk_hw'
>>   BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
>>                                 ^~~~~~
>
> Hrm, seems PowerPC is still not using the common clock API - is there
> any plan for that?  There are some ASoC PowerPC uses so it's going to be
> a bit of an issue as we expand our use of the clock API.

I don't know anything about the common clock API. What would it involve
for powerpc to use it?

cheers
