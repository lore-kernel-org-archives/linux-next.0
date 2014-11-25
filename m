From: Grant Likely <grant.likely@secretlab.ca>
Subject: Fwd: [PATCH v8 5/8] of: i2c: Export single device registration method
Date: Tue, 25 Nov 2014 18:08:05 +0000
Message-ID: <CACxGe6trs1eAf2N_7PZaW_f+3rhE5O_DGXkxNqpy840Mqs2XoQ@mail.gmail.com>
References: <1414528565-10907-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1414528565-10907-6-git-send-email-pantelis.antoniou@konsulko.com>
 <20141121014631.C86D5C413E8@trevor.secretlab.ca> <20141123162229.GA1303@katana>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=047d7bd756b0208d500508b2ccda
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:41649 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750791AbaKYSI0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2014 13:08:26 -0500
Received: by mail-ig0-f177.google.com with SMTP id z20so1161000igj.16
        for <linux-next@vger.kernel.org>; Tue, 25 Nov 2014 10:08:25 -0800 (PST)
In-Reply-To: <20141123162229.GA1303@katana>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>

--047d7bd756b0208d500508b2ccda
Content-Type: text/plain; charset=ISO-8859-1

Hi Stephen,

Heads up: I just pushed the patch referenced in the below email out to
my tree. It will cause a merge conflict, but it shouldn't be too
difficult to resolve from what I see in commit 2fd36c552649 "i2c:
core: Map OF IRQ at probe time".

Let me know if it causes any problems

Cheers,
g.

---------- Forwarded message ----------
From: Wolfram Sang <wsa@the-dreams.de>
Date: Sun, Nov 23, 2014 at 4:22 PM
Subject: Re: [PATCH v8 5/8] of: i2c: Export single device registration method
To: Grant Likely <grant.likely@secretlab.ca>


On Fri, Nov 21, 2014 at 01:46:31AM +0000, Grant Likely wrote:
> On Tue, 28 Oct 2014 22:36:02 +0200
> , Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>  wrote:
> > Dynamically inserting i2c client device nodes requires the use
> > of a single device registration method. Rework and export it.
> >
> > Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>
> Acked-by: Grant Likely <grant.likely@linaro.org>
>
> Wolfram, this patch and the next one only make sense in conjunction with the overlay
> patches, but they don't necessarily need to be merged via the same tree.
> I'm happy to take them, but am equally happy to have you take them
> (assuming I ack the next patch; I haven't looked at it yet). What is
> your preference?

OK, now I had the time to look at it, phew.

Is this targetted for 3.19? Then you can take it:
Reviewed-by: Wolfram Sang <wsa@the-dreams.de>

There is a minor conflict caused by this patch in i2c/for-next which
should be easy to solve, just remove the irq handling.

2fd36c552649 2014-10-30 15:59 Laurent Pinchart   o i2c: core: Map OF
IRQ at probe time

If you target for later than 3.19, then we need to discuss again,
because there might be other i2c core changes coming in.

--047d7bd756b0208d500508b2ccda
Content-Type: application/pgp-signature; name="signature.asc"
Content-Disposition: attachment; filename="signature.asc"
Content-Transfer-Encoding: base64
X-Attachment-Id: ea09ab7375b7d8e8_0.1

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxDQoNCmlRSWNC
QUVCQWdBR0JRSlVjZ25FQUFvSkVCUU41TXdVb0NtMjJ4b1FBSXdZd0xRcHgzRFduUGlZbGtBTDNF
ZzINCnpUczZvZE1xWEV2SzdSN0dQZThvd0M0clVNd2ZxcTh3UmU5N3djbUs4bjVtaU5zWU9tOXdL
MmM2UDFrTVlvMm0NCjRycy8reFc2ekVkY3VxTCtTUVJwVmh6ZHRla3l6cXh3eWxXcHdCZFRiMGh3
R1JncGdvZ2tpSWMrQ1hHMVZyZHMNCjFJcGpwRFRLaXVqYnptQ1R4NnYzZXIvWHhMakNuMThqV2ZC
enlaZ3BVRXNjZE5IdUgwbjZtUGlsZW14dXVVQnUNCk01VUZwUGd2bGZ3aytjSWdRUGFmcFI4TVpl
SmFoc3RiUnJCeldJei9MMFJleXVJckNQbWttZTFxQTkveW0xdTUNCkVkR3hteDFzWk9lOEp4WFds
YlE3T29TeXREa0s3TitmS0hMbWl0R1JFU1RHVUFpWGhoZGxubXA3V0I4SklWVGINCk1TNmMwaXlS
YjVjRU43Z3YwWStGMVZIZzh4eXorTEFjOWd3UHhZWUJSOWpVRUdaVFF1ZFJPTmNGYkdCMGRXTFAN
CnE2bUgvSm1RbFBaSldUQzVHL2ZiZ2xlcjlPWjRUL09QMXVMNDZoNEJ1bERGRVIvRTZsWjF0TXJw
WEhXbkJsV0QNCkNIaXRPOTcvdjQxWVlmSUdvc0wwZzlITmIyanNlTmkwUkMzMFVtTEs5N3ZSaFNa
MUExKzNUeGZpNTE0cWZUZzANCkRMNllWY3BwaWwvVkk2ek5pM2diVkNRdFFyczliamlnWjV0VERX
cHRBK0lvRkNkTDI5UTQ4RXlxelM5NTMyd2cNCk50VGJ5S04zN1JHU1RCOUdkNElsWkhnSFB0Rmhv
VDVMYmxVcVFQdFp5L0dOT0lXbXlDK3RvRHk0SlNEWjVLMHkNCk1qZUhaYm1WdU9QM2VNQyt3clYv
DQo9c0lnMQ0KLS0tLS1FTkQgUEdQIFNJR05BVFVSRS0tLS0tDQo=
--047d7bd756b0208d500508b2ccda--
