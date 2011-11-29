From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next: build failure after merge of the hid tree
Date: Mon, 28 Nov 2011 17:30:59 -0800
Message-ID: <4ED435D3.70300@goop.org>
References: <20111129120059.a1818d7eaf663546edc6dc34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from claw.goop.org ([74.207.240.146]:35462 "EHLO claw.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751663Ab1K2BbF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Nov 2011 20:31:05 -0500
In-Reply-To: <20111129120059.a1818d7eaf663546edc6dc34@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jikos@jikos.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On 11/28/2011 05:00 PM, Stephen Rothwell wrote:
> Hi Jiri,
>
> After merging the hid tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> drivers/hid/hid-input.c: In function 'hidinput_hid_event':
> drivers/hid/hid-input.c:865:6: error: 'struct hid_device' has no member
named 'battery_val'
> drivers/hid/hid-input.c:866:3: error: 'struct hid_device' has no member
named 'battery_min'
> drivers/hid/hid-input.c:866:3: error: 'struct hid_device' has no member
named 'battery_max'
>
> Caused by commit 4f5ca836bef3 ("HID: hid-input: add support for HID
> devices reporting Battery Strength"). Those members are only defined when
> CONFIG_HID_BATTERY_STRENGTH is set.
>
> I have used the hid tree from next-20111128 for today.

Oh, sorry about that.  Is this sufficient?

Subject: [PATCH] hid-input: fix compile for !HID_BATTERY_STRENGTH

As reported by Stephen Rothwell:
drivers/hid/hid-input.c: In function 'hidinput_hid_event':
drivers/hid/hid-input.c:865:6: error: 'struct hid_device' has no member
named 'battery_val'
drivers/hid/hid-input.c:866:3: error: 'struct hid_device' has no member
named 'battery_min'
drivers/hid/hid-input.c:866:3: error: 'struct hid_device' has no member
named 'battery_max'

Signed-off-by: Jeremy Fitzhardinge <jeremy@goop.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 83afb86..d9cadb3 100644
- --- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -861,12 +861,14 @@ void hidinput_hid_event(struct hid_device *hid,
struct hid_field *field, struct
 
     input = field->hidinput->input;
 
+#ifdef CONFIG_HID_BATTERY_STRENGTH
     if (usage->hid == HID_DC_BATTERYSTRENGTH) {
         hid->battery_val = value;
         hid_dbg(hid, "battery value is %d (range %d-%d)\n",
             value, hid->battery_min, hid->battery_max);
         return;
     }
+#endif
 
     if (!usage->type)
         return;

    J
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEkBAEBCgAGBQJO1DXKAAoJEAUkni6MUg7H2/wIPAk0oHGVawNScWJdJXMhMVca
ApxAr1h2v5kgIzRlihkpOiK3opft/GzBYh54HHd4nPdC5D4KAmuOXeX2+fwVgIEG
SlrwsGU4J9n9uH/e3qgJf2aANcWH+bQwqL58ZyLE0Yo+N3dBzDNaNGd8Gygw8jk+
mGtsMAfjIwe5vDLmsIED1+hqGNUL8/vt+TnCcpNVWUdrUtCT7dpDifcoeblO/qrs
5hWbpf+AOek7UEoHQ0qAbRLi8A1FcoMs20mHiSpkfVn2d2gUYUYZRjeW66xwuKB7
Q9iYEoOEszj+07nkHvS8VZZFMIXKsBOvkDVrktQtgDTZzI71axbgKPK8UESjjH4U
uMPpWmv8yA==
=2NZE
-----END PGP SIGNATURE-----
