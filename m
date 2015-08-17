From: KY Srinivasan <kys@microsoft.com>
Subject: RE: linux-next: Tree for Aug 17 (mshyperv.c)
Date: Mon, 17 Aug 2015 17:53:43 +0000
Message-ID: <BY2PR0301MB1654D0D94248C2A024D76B46A0790@BY2PR0301MB1654.namprd03.prod.outlook.com>
References: <20150817205533.72ebb3fb@canb.auug.org.au>
 <55D21B3A.2090109@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <55D21B3A.2090109@infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Haiyang Zhang <haiyangz@microsoft.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



> -----Original Message-----
> From: Randy Dunlap [mailto:rdunlap@infradead.org]
> Sent: Monday, August 17, 2015 10:35 AM
> To: Stephen Rothwell <sfr@canb.auug.org.au>; linux-next@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org; devel@driverdev.osuosl.org; KY Srinivasan
> <kys@microsoft.com>; Haiyang Zhang <haiyangz@microsoft.com>
> Subject: Re: linux-next: Tree for Aug 17 (mshyperv.c)
> 
> On 08/17/15 03:55, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20150813:
> >
> 
> on i386 (for several days now):
> 
> when CONFIG_KEXEC is not enabled:
> 
> 
> arch/x86/built-in.o: In function `hv_machine_crash_shutdown':
> mshyperv.c:(.text+0x2d9d4): undefined reference to
> `native_machine_crash_shutdown'

Vitaly has submitted a patch to fix this.

K. Y
> 
> 
> 
> --
> ~Randy
