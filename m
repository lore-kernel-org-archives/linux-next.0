Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1895D34C83C;
	Wed, 28 Jan 2026 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769602437; cv=none; b=nGhiwopx05dVeY+4Ajm2vrKr6jeb3a8LsSx7m247z+L9EaVpT2aJ1DfiUVSZ+Iv4GsUDQtcrqTmr3/IheweUXTbUoYX6XsJpYZTPS3US5lm8cUF1Cp4NAdJcJ/K1B4RGuhGlNDo+dp1pvanaumqK3BLQ6qRKCiYqb++I9dHtAGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769602437; c=relaxed/simple;
	bh=O0tU9lU3PEWB9Jhw98SDguLjgaRIvVY7G+DMdAi3ZMc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=O6G8bGWqbhwAlOm+JKKCXbmgBPiZJceXOBE7QY2j9+TOSOT5ILpHyJ2Hnxsb1M/ZP8rBf9BLCeZctND1VFqdwrPB9xMo3RpxdkEj46a+EiLdjpxucTxRd5nrLQ7pjJnsm78/URaPknzN+z/CTh80Ku/jiRZyRtJetQrw8u+ydoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MqinWGHP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqinWGHP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769602436; x=1801138436;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=O0tU9lU3PEWB9Jhw98SDguLjgaRIvVY7G+DMdAi3ZMc=;
  b=MqinWGHPD6jnwMfdeRAxmYN3+gqylUtnocfm5AU0QbtBfPI91fPSDHSA
   nacGR8SwjWDWEGq00sA/Ut1S4Mp+uA8sYxGhzVWEKEUhC4yYpEDNTNwFC
   m+nkdobaWFPU/v8td0veodp7KVH1i2dkMEu4XdKa0ecNr5My6tdmBTT2p
   eZVRUWKi5vftncWBBoTV+z9Yg1ttZ9ZDRwww55JQ46WPpBstyUaGxe9Sc
   rE7xhqLJ+U6IMOJFuw7NmgoHx6aijubsKwAHJPaHqUZXTjotP32NJVesf
   ONivX9PJim+xIF1DGHm91d5OykQI5p9XAGee0pfKOfoEvcAQp0vye94YF
   w==;
X-CSE-ConnectionGUID: 6LtByy0OSJSKqUqOaWJI1w==
X-CSE-MsgGUID: a0Fswjx9SAe3GdDWFNeC+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74438677"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74438677"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:13:55 -0800
X-CSE-ConnectionGUID: ZR6nCx6yR7unGhVbggaV8Q==
X-CSE-MsgGUID: rCVf6dCPQhuDqOCUzrWqgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="239505900"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.14])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:13:51 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 28 Jan 2026 14:13:48 +0200 (EET)
To: Mark Brown <broonie@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
    Jiri Kosina <jikos@kernel.org>
cc: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>, 
    Antheas Kapenekakis <lkml@antheas.dev>, 
    Connor Belli <connorbelli2003@gmail.com>, 
    Ionut Nechita <ionut_n2001@yahoo.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the hid
 tree
In-Reply-To: <aXjiJsJamyzEU8Xi@sirena.org.uk>
Message-ID: <8f5f8746-e248-08b4-50da-11a2b58e1d12@linux.intel.com>
References: <aXjiJsJamyzEU8Xi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Jan 2026, Mark Brown wrote:

> Hi all,

I don't know why Benjamin didn't appear as a receipient here.

> Today's linux-next merge of the drivers-x86 tree got a conflict in:
> 
>   drivers/hid/hid-asus.c
> 
> between commits:
> 
>   f631011e36b87 ("HID: hid-asus: Implement fn lock for Asus ProArt P16")
>   06501b557faec ("HID: asus: Replace magic number with HID_UP_ASUSVENDOR constant")
> 
> from the hid tree and commits:
> 
>   3415a1beb3d87 ("HID: asus: initialize additional endpoints only for certain devices")
>   8baca948f6aad ("HID: asus: move vendor initialization to probe")
> 
> from the drivers-x86 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for the heads up.

I moved this asus kbd series into a separate branch and merged that into 
my for-next branch. I could create an IB PR for that branch if HID 
maintainers so prefer, though admittedly the conflict doesn't look 
particularly complex.

> diff --cc drivers/hid/hid-asus.c
> index df7c03dde67fa,f5c8df20b88bf..0000000000000
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@@ -101,7 -90,7 +101,8 @@@ MODULE_DESCRIPTION("Asus HID Keyboard a
>   #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
>   #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>   #define QUIRK_ROG_ALLY_XPAD		BIT(13)
>  -#define QUIRK_ROG_NKEY_ID1ID2_INIT		BIT(14)
>  +#define QUIRK_HID_FN_LOCK		BIT(14)
> ++#define QUIRK_ROG_NKEY_ID1ID2_INIT		BIT(15)
>   
>   #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>   						 QUIRK_NO_INIT_REPORTS | \
> @@@ -1490,10 -1372,10 +1464,10 @@@ static const struct hid_device_id asus_
>   	  QUIRK_USE_KBD_BACKLIGHT },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> - 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> + 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_ID1ID2_INIT },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> - 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_HID_FN_LOCK },
>  -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_ID1ID2_INIT },
> ++	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_HID_FN_LOCK | QUIRK_ROG_NKEY_ID1ID2_INIT },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
>   	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> 
> index 876529df0d6ae..1b9793f7c07ed 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -959,6 +959,12 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
>  		}
>  	}
>  
> +	if (drvdata->quirks & QUIRK_HID_FN_LOCK) {
> +		drvdata->fn_lock = true;
> +		INIT_WORK(&drvdata->fn_lock_sync_work, asus_sync_fn_lock);
> +		asus_kbd_set_fn_lock(hdev, true);
> +	}
> +
>  	if (drvdata->tp) {
>  		int ret;
>  
> 

-- 
 i.

