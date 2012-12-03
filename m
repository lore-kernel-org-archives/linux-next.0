From: Jon Hunter <jon-hunter@ti.com>
Subject: Re: omap2plus_defconfig fails to build
Date: Mon, 3 Dec 2012 17:38:34 -0600
Message-ID: <50BD37FA.2090501@ti.com>
References: <CAAfyv37BA4YMRFJsN5n7EeAD7iE3hzQ2PDqBAtqCju7JdxrvTA@mail.gmail.com>
 <20121204102631.3d8d41e3e8a8c0eb71734e55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121204102631.3d8d41e3e8a8c0eb71734e55@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Belisko Marek <marek.belisko@gmail.com>, Olof Johansson <olof@lixom.net>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 12/03/2012 05:26 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 29 Nov 2012 11:40:18 +0100 Belisko Marek <marek.belisko@gmail.com> wrote:
>>
>> I've update linux-next to next-20121129 and omap2plus_defconfig fails to build:
>> arch/arm/mach-omap2/timer.c: In function 'omap_get_timer_dt':
>> arch/arm/mach-omap2/timer.c:195: error: implicit declaration of
>> function 'prom_add_property'
> 
> Caused by commit 9725f4451a9c ("ARM: OMAP: Add DT support for timer
> driver") from the arm-soc tree interacting with commit 79d1c712958f
> ("powerpc+of: Rename the drivers/of prom_* functions to of_*") from the
> powerpc tree.
> 
> I will fix this up in today' linux-next (by changing prom_add_property to
> of_add_property).  Someone will need to remember to tell Linus when the
> latter of those two commits gets merged.

Just to let you know there is a patch available for this problem [1].

Tony, Olof, Arnd, not sure how you guys wish to handle this one.

Cheers
Jon

[1] http://www.spinics.net/lists/arm-kernel/msg210179.html
