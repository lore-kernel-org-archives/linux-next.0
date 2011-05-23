From: Guenter Roeck <guenter.roeck@ericsson.com>
Subject: Re: linux-next: Tree for May 23 (hwmon/coretemp.c)
Date: Mon, 23 May 2011 11:03:37 -0700
Message-ID: <1306173817.2163.354.camel@groeck-laptop>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
	<20110523104958.98ef4d1a.randy.dunlap@oracle.com>
Reply-To: guenter.roeck@ericsson.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <lm-sensors-bounces@lm-sensors.org>
In-Reply-To: <20110523104958.98ef4d1a.randy.dunlap@oracle.com>
List-Unsubscribe: <http://lists.lm-sensors.org/mailman/options/lm-sensors>,
	<mailto:lm-sensors-request@lm-sensors.org?subject=unsubscribe>
List-Archive: <http://lists.lm-sensors.org/pipermail/lm-sensors/>
List-Post: <mailto:lm-sensors@lm-sensors.org>
List-Help: <mailto:lm-sensors-request@lm-sensors.org?subject=help>
List-Subscribe: <http://lists.lm-sensors.org/mailman/listinfo/lm-sensors>,
	<mailto:lm-sensors-request@lm-sensors.org?subject=subscribe>
Sender: lm-sensors-bounces@lm-sensors.org
Errors-To: lm-sensors-bounces@lm-sensors.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Fenghua Yu <fenghua.yu@intel.com>, LKML <linux-kernel@vger.kernel.org>, "lm-sensors@lm-sensors.org" <lm-sensors@lm-sensors.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Sigh. And I was sure I tested that :(. I'll look into it immediately.

Guenter

On Mon, 2011-05-23 at 13:49 -0400, Randy Dunlap wrote:
> On Mon, 23 May 2011 15:45:18 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20110520:
> 
> when CONFIG_SMP is not enabled:
> 
> drivers/hwmon/coretemp.c:765: error: implicit declaration of function 'cpu_sibling_mask'
> 
> 
> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your code ***
> 
> _______________________________________________
> lm-sensors mailing list
> lm-sensors@lm-sensors.org
> http://lists.lm-sensors.org/mailman/listinfo/lm-sensors



_______________________________________________
lm-sensors mailing list
lm-sensors@lm-sensors.org
http://lists.lm-sensors.org/mailman/listinfo/lm-sensors
