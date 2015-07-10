From: "Suzuki K. Poulose" <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH] regulators: Add missing dummy definition for regulator_list_voltage
Date: Fri, 10 Jul 2015 16:14:25 +0100
Message-ID: <559FE151.2030305@arm.com>
References: <558D2FB3.1060209@arm.com> <1435316810-8634-1-git-send-email-suzuki.poulose@arm.com> <20150707123838.GF2887@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eu-smtp-delivery-143.mimecast.com ([146.101.78.143]:27249 "EHLO
	eu-smtp-delivery-143.mimecast.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932716AbbGJPO2 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Jul 2015 11:14:28 -0400
In-Reply-To: <20150707123838.GF2887@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "paul@pwsan.com" <paul@pwsan.com>, "treding@nvidia.com" <treding@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>

On 07/07/15 13:38, Mark Brown wrote:
> On Fri, Jun 26, 2015 at 12:06:50PM +0100, Suzuki K. Poulose wrote:
>
>> +static inline int regulator_list_voltage(struct regulator *regulator, unsigned selector)
>> +{
>> +	return 0;
>> +}
>
> I'd expect this stub to return -EINVAL since the voltage count should be
> zero for !REGULATOR (since we obviously can't count the number of
> voltages).
>
You are right, -EINVAL suites better. There are some users of the
API who consider 0 as invalid, but -EINVAL sounds better and covers
all the existing uses. Will resend the patch.

Thanks
Suzuki
