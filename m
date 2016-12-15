From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Initialize local
 in_tablet_mode and type
Date: Thu, 15 Dec 2016 20:15:02 +0200
Message-ID: <1481825702.9552.44.camel@linux.intel.com>
References: <20161215041424.GA19534@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:3475 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755837AbcLOSPF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Dec 2016 13:15:05 -0500
In-Reply-To: <20161215041424.GA19534@f23x64.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@linux.intel.com>, Lyude <lyude@redhat.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, platform-drivers-x86@vger.kernel.org

On Wed, 2016-12-14 at 20:14 -0800, Darren Hart wrote:
> linux-next reported in_tablet_mode and type may be used uninitialized
> after:
> 
> b31800283868 ("platform/x86: thinkpad_acpi: Move tablet detection into
> separate function")
> 
> This turns out to be a false positive as the pr_info call cannot be
> reached if tp_features.hotkey_tablet (global scope) is 0, and
> in_tablet_mode and type are assigned in both places
> tp_features.hotkey_tablet is assigned.
> 
> Regardless, to make it explicit and avoid further reports, initialize
> in_tablet_mode to 0 and type to "".
> 

@@ -3143,8 +3143,8 @@ typedef tpacpi_keymap_entry_t
> tpacpi_keymap_t[TPACPI_HOTKEY_MAP_LEN];
>  
>  static int hotkey_init_tablet_mode(void)
>  {
> -	int in_tablet_mode, res;
> -	char *type;
> +	int in_tablet_mode = 0, res;
> +	char *type = "";

Subtle correction
NULL will work either and takes less memory ;)

P.S. Even pr_*() is NULL-aware


>  
>  	if (acpi_evalf(hkey_handle, &res, "MHKG", "qd")) {
>  		/* For X41t, X60t, X61t Tablets... */
> -- 
> 2.9.3
> 
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
