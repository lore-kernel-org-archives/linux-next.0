From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the extcon tree
Date: Sat, 27 Jun 2015 10:16:42 +1000
Message-ID: <20150627101642.75a9e173@canb.auug.org.au>
References: <20150525210503.6bd3dec3@canb.auug.org.au>
	<20150604191838.26c8ac23@canb.auug.org.au>
	<20150605105346.GD5346@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44056 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752006AbbF0AQp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Jun 2015 20:16:45 -0400
In-Reply-To: <20150605105346.GD5346@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Linus <torvalds@linux-foundation.org>
Cc: Sebastian Reichel <sre@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ramakrishna Pallala <ramakrishna.pallala@intel.com>, Lee Jones <lee.jones@linaro.org>

Hi Greg,

On Fri, 5 Jun 2015 19:53:46 +0900 Greg KH <greg@kroah.com> wrote:
>
> On Thu, Jun 04, 2015 at 07:18:38PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > This is now needed when the char-misc and battery trees are merged ...
> > 
> > On Mon, 25 May 2015 21:05:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > > 
> > > After merging the extcon tree, today's linux-next build (powerpc
> > > allyesconfig) failed like this:
> > > 
> > > drivers/power/axp288_charger.c: In function 'axp288_charger_probe':
> > > drivers/power/axp288_charger.c:851:8: error: incompatible type for argument 2 of 'extcon_register_notifier'
> > >   ret = extcon_register_notifier(info->cable.edev, &info->cable.nb);
> > >         ^
> > > In file included from drivers/power/axp288_charger.c:29:0:
> > > include/linux/extcon.h:240:12: note: expected 'enum extcon' but argument is of type 'struct notifier_block *'
> > >  extern int extcon_register_notifier(struct extcon_dev *edev, enum extcon id,
> > >             ^
> > > drivers/power/axp288_charger.c:851:8: error: too few arguments to function 'extcon_register_notifier'
> > >   ret = extcon_register_notifier(info->cable.edev, &info->cable.nb);
> > >         ^
> > > In file included from drivers/power/axp288_charger.c:29:0:
> > > include/linux/extcon.h:240:12: note: declared here
> > >  extern int extcon_register_notifier(struct extcon_dev *edev, enum extcon id,
> > >             ^
> > > drivers/power/axp288_charger.c:912:2: error: incompatible type for argument 2 of 'extcon_unregister_notifier'
> > >   extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
> > >   ^
> > > In file included from drivers/power/axp288_charger.c:29:0:
> > > include/linux/extcon.h:242:12: note: expected 'enum extcon' but argument is of type 'struct notifier_block *'
> > >  extern int extcon_unregister_notifier(struct extcon_dev *edev, enum extcon id,
> > >             ^
> > > drivers/power/axp288_charger.c:912:2: error: too few arguments to function 'extcon_unregister_notifier'
> > >   extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
> > >   ^
> > > In file included from drivers/power/axp288_charger.c:29:0:
> > > include/linux/extcon.h:242:12: note: declared here
> > >  extern int extcon_unregister_notifier(struct extcon_dev *edev, enum extcon id,
> > >             ^
> > > drivers/power/axp288_charger.c: In function 'axp288_charger_remove':
> > > drivers/power/axp288_charger.c:923:2: error: incompatible type for argument 2 of 'extcon_unregister_notifier'
> > >   extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
> > >   ^
> > > In file included from drivers/power/axp288_charger.c:29:0:
> > > include/linux/extcon.h:242:12: note: expected 'enum extcon' but argument is of type 'struct notifier_block *'
> > >  extern int extcon_unregister_notifier(struct extcon_dev *edev, enum extcon id,
> > >             ^
> > > drivers/power/axp288_charger.c:923:2: error: too few arguments to function 'extcon_unregister_notifier'
> > >   extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
> > >   ^
> > > In file included from drivers/power/axp288_charger.c:29:0:
> > > include/linux/extcon.h:242:12: note: declared here
> > >  extern int extcon_unregister_notifier(struct extcon_dev *edev, enum extcon id,
> > >             ^
> > > 
> > > Caused by commit 843735b788a4 ("power: axp288_charger: axp288 charger
> > > driver") from the battery tree interacting with commit 046050f6e623
> > > ("extcon: Update the prototype of extcon_register_notifier() with enum
> > > extcon") from the extcon tree.
> > > 
> > > I applied this merge fix patch for tday and can carry it as necessary
> > > (it is clearly not correct, but it will make it build):
> > > 
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Mon, 25 May 2015 21:00:24 +1000
> > > Subject: [PATCH] power: axp288_charger: fix for AIP change
> > > 
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  drivers/power/axp288_charger.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/power/axp288_charger.c b/drivers/power/axp288_charger.c
> > > index 5680317f4823..e4d569f57acc 100644
> > > --- a/drivers/power/axp288_charger.c
> > > +++ b/drivers/power/axp288_charger.c
> > > @@ -848,7 +848,7 @@ static int axp288_charger_probe(struct platform_device *pdev)
> > >  	/* Register for extcon notification */
> > >  	INIT_WORK(&info->cable.work, axp288_charger_extcon_evt_worker);
> > >  	info->cable.nb.notifier_call = axp288_charger_handle_cable_evt;
> > > -	ret = extcon_register_notifier(info->cable.edev, &info->cable.nb);
> > > +	ret = extcon_register_notifier(info->cable.edev, EXTCON_NONE, &info->cable.nb);
> > >  	if (ret) {
> > >  		dev_err(&info->pdev->dev,
> > >  			"failed to register extcon notifier %d\n", ret);
> > > @@ -909,7 +909,7 @@ intr_reg_failed:
> > >  		extcon_unregister_interest(&info->otg.cable);
> > >  	power_supply_unregister(info->psy_usb);
> > >  psy_reg_failed:
> > > -	extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
> > > +	extcon_unregister_notifier(info->cable.edev, EXTCON_NONE, &info->cable.nb);
> > >  	return ret;
> > >  }
> > >  
> > > @@ -920,7 +920,7 @@ static int axp288_charger_remove(struct platform_device *pdev)
> > >  	if (info->otg.cable.edev)
> > >  		extcon_unregister_interest(&info->otg.cable);
> > >  
> > > -	extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
> > > +	extcon_unregister_notifier(info->cable.edev, EXTCON_NONE, &info->cable.nb);
> > >  	power_supply_unregister(info->psy_usb);
> > >  
> > >  	return 0;
> 
> I think we are going to have to resolve this when it hits Linus's tree
> :(

We missed this merge resolution - it is now needed in Linus' tree :-(

Linus: here is the patch again:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 May 2015 21:00:24 +1000
Subject: [PATCH] power: axp288_charger: fix for API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/power/axp288_charger.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/power/axp288_charger.c b/drivers/power/axp288_charger.c
index 5680317f4823..e4d569f57acc 100644
--- a/drivers/power/axp288_charger.c
+++ b/drivers/power/axp288_charger.c
@@ -848,7 +848,7 @@ static int axp288_charger_probe(struct platform_device *pdev)
 	/* Register for extcon notification */
 	INIT_WORK(&info->cable.work, axp288_charger_extcon_evt_worker);
 	info->cable.nb.notifier_call = axp288_charger_handle_cable_evt;
-	ret = extcon_register_notifier(info->cable.edev, &info->cable.nb);
+	ret = extcon_register_notifier(info->cable.edev, EXTCON_NONE, &info->cable.nb);
 	if (ret) {
 		dev_err(&info->pdev->dev,
 			"failed to register extcon notifier %d\n", ret);
@@ -909,7 +909,7 @@ intr_reg_failed:
 		extcon_unregister_interest(&info->otg.cable);
 	power_supply_unregister(info->psy_usb);
 psy_reg_failed:
-	extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
+	extcon_unregister_notifier(info->cable.edev, EXTCON_NONE, &info->cable.nb);
 	return ret;
 }
 
@@ -920,7 +920,7 @@ static int axp288_charger_remove(struct platform_device *pdev)
 	if (info->otg.cable.edev)
 		extcon_unregister_interest(&info->otg.cable);
 
-	extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
+	extcon_unregister_notifier(info->cable.edev, EXTCON_NONE, &info->cable.nb);
 	power_supply_unregister(info->psy_usb);
 
 	return 0;
-- 
2.1.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
