From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Sept 11 (drm related: boot problems on amd64)
Date: Tue, 11 Sep 2012 20:29:52 +0200
Message-ID: <CA+icZUXh1Vh=ojJKd34Cnm+sO+U1OqrcSk=5-EwXd22oB5Jw9Q@mail.gmail.com>
References: <CA+icZUUj1u6YwpkzXOsUVJ4p5t-qrCWVDoaFoDbAbMT2EbEwWw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:60720 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753490Ab2IKS3x (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 Sep 2012 14:29:53 -0400
In-Reply-To: <CA+icZUUj1u6YwpkzXOsUVJ4p5t-qrCWVDoaFoDbAbMT2EbEwWw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>

On Tue, Sep 11, 2012 at 8:12 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Tue, Sep 11, 2012 at 8:31 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> Changes since 201209010:
>>
>> New tree: ixp4xx
>>
>> The pci tree gained a build failure so I used the version from
>> next-20120910.
>>
>> The regulator tree lost its build failure.
>>
>> The staging tree lost its build failure.
>>
>> The akpm tree lost a few patches that turned up elsewhere.
>>
>> ----------------------------------------------------------------------------
>>
>
> Hi,
>
> today's and yesterday's Linux-Next is broken for me again.
> I tried with systemd and upstart on Ubuntu/precise, with nomodeset and
> rescue boot-option.
>
> With rescue boot-option I see this in my logs (Intel sandy-bridge
> ultrabook here):
>
> Sep 11 18:43:36 fambox kernel: [    9.654972] [drm:drm_pci_agp_init]
> *ERROR* Cannot initialize the agpgart module.
> Sep 11 18:43:36 fambox kernel: [    9.654980] DRM: Fill_in_dev failed.
>
> I have not checked any MLs... coming from hospital right now.
>

More ERRORs:

# grep -A1 "ERROR" /var/log/kern.log
Sep 10 17:51:29 fambox kernel: [   10.205818]
[drm:i915_get_bridge_dev] *ERROR* bridge device not found
Sep 10 17:51:29 fambox kernel: [   10.206055] i915: probe of
0000:00:02.0 failed with error -5
--
Sep 10 15:53:00 fambox kernel: [   10.500387]
[drm:i915_get_bridge_dev] *ERROR* bridge device not found
Sep 10 15:53:00 fambox kernel: [   10.500602] i915: probe of
0000:00:02.0 failed with error -5
--
Sep 11 20:41:01 fambox kernel: [    9.636010]
[drm:i915_get_bridge_dev] *ERROR* bridge device not found
Sep 11 20:41:01 fambox kernel: [    9.636202] i915: probe of
0000:00:02.0 failed with error -5
--
Sep 11 18:42:18 fambox kernel: [   10.132229]
[drm:i915_get_bridge_dev] *ERROR* bridge device not found
Sep 11 18:42:18 fambox kernel: [   10.132433] i915: probe of
0000:00:02.0 failed with error -5
--
Sep 11 18:43:36 fambox kernel: [    9.654972] [drm:drm_pci_agp_init]
*ERROR* Cannot initialize the agpgart module.
Sep 11 18:43:36 fambox kernel: [    9.654980] DRM: Fill_in_dev failed.
--
Sep 11 19:52:10 fambox kernel: [    9.545562]
[drm:i915_get_bridge_dev] *ERROR* bridge device not found
Sep 11 19:52:10 fambox kernel: [    9.545798] i915: probe of
0000:00:02.0 failed with error -5
--
Sep 11 20:04:09 fambox kernel: [    9.798233]
[drm:i915_get_bridge_dev] *ERROR* bridge device not found
Sep 11 20:04:09 fambox kernel: [    9.798557] i915: probe of
0000:00:02.0 failed with error -5

- Sedat -

> Regards,
> - Sedat -
