From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: powerpc allyesconfig / allmodconfig linux-next next-20160729 -
 next-20160729 build failures
Date: Thu, 4 Aug 2016 12:06:41 -0500
Message-ID: <20160804170640.GC22744@gate.crashing.org>
References: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com>
 <1880505.MpH3ISbtMJ@wuerfel> <20160804214713.4baa832e@roar.ozlabs.ibm.com>
 <2405930.iJXNaXEjI5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <2405930.iJXNaXEjI5@wuerfel>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Fengguang Wu <fengguang.wu@intel.com>, linuxppc-dev@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 04, 2016 at 06:10:57PM +0200, Arnd Bergmann wrote:
> On Thursday, August 4, 2016 9:47:13 PM CEST Nicholas Piggin wrote:
> 
> > +	__used							\
> > +	__attribute__((section("___kentry" "+" #sym ",\"a\",@note #"), used)) \
> 
> 
> I've just started testing this, but the first problem I ran into
> is that @ and # are special characters that have an architecture
> specific meaning to the assembler. On ARM, you need "%note @" instead
> of "@note #".

That comment trick (I still feel guilty about it) causes more problems
than it solves.  Please don't try to use it :-)


Segher
