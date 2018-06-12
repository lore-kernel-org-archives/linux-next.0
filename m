From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
Date: Mon, 11 Jun 2018 22:18:19 -0700
Message-ID: <20180612051819.GB112645@localhost.localdomain>
References: <20180612112310.2d77e1c3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180612112310.2d77e1c3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jun 12, 2018 at 11:23:10AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drivers-x86 tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/platform/x86/silead_dmi.c:84:21: error: variable 'chuwi_vi10_data' has initializer but incomplete type
>  static const struct ts_dmi_data chuwi_vi10_data = {
>                      ^~~~~~~~~~~
> drivers/platform/x86/silead_dmi.c:85:3: error: 'const struct ts_dmi_data' has no member named 'acpi_name'
>   .acpi_name      = "MSSL0002:00",
>    ^~~~~~~~~
> drivers/platform/x86/silead_dmi.c:85:20: warning: excess elements in struct initializer
>   .acpi_name      = "MSSL0002:00",
>                     ^~~~~~~~~~~~~
> drivers/platform/x86/silead_dmi.c:85:20: note: (near initialization for 'chuwi_vi10_data')
> drivers/platform/x86/silead_dmi.c:86:3: error: 'const struct ts_dmi_data' has no member named 'properties'
>   .properties     = chuwi_vi10_props,
>    ^~~~~~~~~~
> drivers/platform/x86/silead_dmi.c:86:20: warning: excess elements in struct initializer
>   .properties     = chuwi_vi10_props,
>                     ^~~~~~~~~~~~~~~~
> drivers/platform/x86/silead_dmi.c:86:20: note: (near initialization for 'chuwi_vi10_data')
> drivers/platform/x86/silead_dmi.c:84:33: error: storage size of 'chuwi_vi10_data' isn't known
>  static const struct ts_dmi_data chuwi_vi10_data = {
>                                  ^~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   2da502a0aea7 ("platform/x86: silead_dmi: Add touchscreen info for the Chuwi Vi10 tablet")
> 
> I have reverted that commit for today.  More care please.

Thank you Stephen. We caught this earlier, but failed to remove it from for-next
while repairing the series. Our apologies. I have removed this series back to
the known good patch in for-next:

26ed9d1 platform/x86: silead_dmi: Add entry for Chuwi Hi8 tablet touchscreen

Andy has this reworked already and is working on completing
testing before pushing the update to for-next.

-- 
Darren Hart
VMware Open Source Technology Center
