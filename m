From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: powerpc allyesconfig / allmodconfig linux-next next-20160729 -
 next-20160729 build failures
Date: Thu, 4 Aug 2016 23:54:18 +1000
Message-ID: <20160804235418.1f235f55@roar.ozlabs.ibm.com>
References: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com>
 <1880505.MpH3ISbtMJ@wuerfel>
 <20160804214713.4baa832e@roar.ozlabs.ibm.com>
 <4007331.2ypSqpxHsb@wuerfel>
 <20160804223139.0196b3aa@roar.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20160804223139.0196b3aa@roar.ozlabs.ibm.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Nicolas Pitre <nico@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Fengguang Wu <fengguang.wu@intel.com>, linuxppc-dev@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-next.vger.kernel.org

On Thu, 4 Aug 2016 22:31:39 +1000
Nicholas Piggin <npiggin@gmail.com> wrote:
> On Thu, 04 Aug 2016 14:09:02 +0200
> Arnd Bergmann <arnd@arndb.de> wrote:
> > Nicolas Pitre has done some related work, adding him to Cc. IIRC we have
> > actually had multiple implementations of -ffunction-sections/--gc-sections
> > in the past that people have used in production, but none of them
> > ever made it upstream.  

After some googling around it seems lto has been difficult to
get in and it was agreed this gc-sections should be done first
anyway (although it may indeed provide a superset of DCE, but
it's always going to be more costly and complicated). Lto would
have the same issue with liveness of entry points, which is
really the only thing you need change in the kernel as far as I
can see.

I didn't really see what problems people were having with it
though, so maybe it's architecture specific or something I
haven't run into yet.

Thanks,
Nick
