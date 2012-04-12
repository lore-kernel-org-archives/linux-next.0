From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the final tree
 (devicetree tree related)
Date: Wed, 11 Apr 2012 18:35:34 -0600
Message-ID: <CACxGe6tDa+AzK0O=E+EPZ90Ek_C-rM-G4fHSnsdL0S+fNcmzmw@mail.gmail.com>
References: <20120411151155.b1a614f174442a592d1c1561@canb.auug.org.au> <20120412103157.70669ff82b81d5d926c36d4d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:37885 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756059Ab2DLAfz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Apr 2012 20:35:55 -0400
Received: by obbtb18 with SMTP id tb18so1946715obb.19
        for <linux-next@vger.kernel.org>; Wed, 11 Apr 2012 17:35:54 -0700 (PDT)
In-Reply-To: <20120412103157.70669ff82b81d5d926c36d4d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>

On Wed, Apr 11, 2012 at 6:31 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Grant,
>
> On Wed, 11 Apr 2012 15:11:55 +1000 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>>
>> After merging the final tree, today's linux-next build (sparc64 defc=
onfig)
>> failed like this:
>>
>> drivers/of/of_mdio.c: In function 'of_mdiobus_register':
>> drivers/of/of_mdio.c:75:4: error: implicit declaration of function '=
irq_of_parse_and_map' [-Werror=3Dimplicit-function-declaration]
>>
>> Caused by commit e46c11b94787 ("of/irq: add empty irq_of_parse_and_m=
ap()
>> for non-dt builds"). =A0SPARC has CONFIG_OF but not CONFIG_OF_IRQ ..=
=2E
>>
>> I have reverted that commit for today.
>
> That commit is actually in the devicetree-current tree.

Yes, drop that tree or revert that commit.  There's nothing else in
there and I didn't have time to pull it back today before you started
linux-next for the day.  The change is bogus and I'll spin a proper
fixup for tomorrow.

g.
