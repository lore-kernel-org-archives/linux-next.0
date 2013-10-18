From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [BUILD BROKEN] Current Linus' master and -next don't build for
 imx_v6_v7_defconfig
Date: Fri, 18 Oct 2013 09:49:15 -0700
Message-ID: <20131018164915.GA29015@roeck-us.net>
References: <Pine.LNX.4.64.1310181632160.9158@axis700.grange>
 <CAGa+x86+qfWBou2jkEjz10ix95m89cxnyyFOPwryF27YezeoPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAGa+x86+qfWBou2jkEjz10ix95m89cxnyyFOPwryF27YezeoPw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org

On Fri, Oct 18, 2013 at 08:14:36AM -0700, Kevin Hilman wrote:
> On Fri, Oct 18, 2013 at 7:59 AM, Guennadi Liakhovetski
> <g.liakhovetski@gmx.de> wrote:
> 
> > On current Linus' tree as of 04919af as well as -next since 16.10, IIRC,
> > compilation is broken for i.MX3*, including the default
> > imx_v6_v7_defconfig. The toolchain used is
> >
> > arm-none-linux-gnueabi-gcc (Sourcery CodeBench Lite 2012.09-64) 4.7.2
> 
> Just for another data point, I'm not seeing this in my builds
> (arm-linux-gnueabi-gcc (Ubuntu/Linaro 4.7.2-1ubuntu1) 4.7.2) and we're
> not seeing this in Olof's autobuilds either for latest mainline[1] or
> latest next-thierry[2].  I belive Olof is using vanilla gcc 4.8.1.
> 
> Kevin
> 
I don't see the problem either, using "arm-poky-linux-gnueabi-gcc (GCC) 4.7.2"
from Yocto 1.4.2.

Guenter
