From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Request for inclusion of ep93xx tree in linux-next
Date: Tue, 1 May 2012 08:36:28 +0000
Message-ID: <201205010836.28365.arnd@arndb.de>
References: <4F9F16A9.9090108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4F9F16A9.9090108@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ryan Mallon <rmallon@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, arm@kernel.org, Mika Westerberg <mika.westerberg@iki.fi>, linux-next@vger.kernel.org, H Hartley Sweeten <hartleys@visionengravers.com>, "'linux-arm-kernel@lists.infradead.org'" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org

On Monday 30 April 2012, Ryan Mallon wrote:
> Hi Stephen,
> 
> Can you please add the following branches:
> 
>   ep93xx-cleanup
>   ep93xx-fixes
> 
> from the ep93xx git tree:
> 
>   git://github.com/RyanMallon/linux-ep93xx.git
> 
> To linux-next. Both branches are stable and based on v3.4-rc2. Testing
> for the tree is covered by the arm ep93xx_defconfig.
> 

Hi Ryan,

just for your convenience, it helps if you have only one branch that
you get included into linux-next and that combines various branches
which you intend to send to arm-soc. That frees you from the need to
notify Stephen every time you want to have another branch included.

	Arnd
