From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: linux-next: acpi tree build failure
Date: Tue, 08 Sep 2009 08:47:49 +0800
Message-ID: <1252370869.3483.420.camel@rzhang-dt>
References: <20090901125748.fb33b2ea.sfr@canb.auug.org.au>
	 <20090907234612.078bb650.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20090907234612.078bb650.sfr@canb.auug.org.au>
Sender: linux-acpi-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

len,

please revert the two ALS patches.

thanks,
rui

On Mon, 2009-09-07 at 21:46 +0800, Stephen Rothwell wrote:
> Hi Len,
> 
> On Tue, 1 Sep 2009 12:57:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > drivers/acpi/als.c: In function 'acpi_als_get_mappings':
> > drivers/acpi/als.c:173: error: expected ')' before 'PREFIX'
> > drivers/acpi/als.c: In function 'acpi_als_add':
> > drivers/acpi/als.c:347: error: expected ')' before 'PREFIX'
> > 
> > I have used the version of the acpi tree from next-20090831 for today.
> 
> This is still there ...

