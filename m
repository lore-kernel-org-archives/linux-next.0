Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37EB125A9;
	Mon,  2 Feb 2026 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770037301; cv=none; b=dfooD9WFEIKaNcvabHtJn82MQSUtplUq097+UyTqN6DZ6B4ul6hcgeQ8JqNxa2F14RUZlGsWbDAkerQWAiFfo45OwApif6AtCf8KiO2hC+79SBI98HjWD2Dxw2wdVXTGhu3ryKTGw4MewwhN372ydCRnJdBj+trg77zMkK0R72c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770037301; c=relaxed/simple;
	bh=YLoJNsSqNeTUW4J8dCSph3IZ8r9yzogAvfBzlFDKAGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eop/jIYRAHvcC8BMQQ+8/OO+tOHgZT/1n4sIzI7QqBx8pU2oYcvnlYkBIqJCFvnBrs+OrkBLFvPt6OlJt1s0TLLhIily7x9l71YjDLWxVoBZy1pXZmQmL83HV+mT3+ejfYrlsOR8AvwXJw7tCr+zUX4mMa0bR0ZkPAF9qoI2+54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOqnKZ2w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOqnKZ2w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C60C116C6;
	Mon,  2 Feb 2026 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770037301;
	bh=YLoJNsSqNeTUW4J8dCSph3IZ8r9yzogAvfBzlFDKAGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FOqnKZ2w1HsrQ0cG7+KxZtOlDl1i8vB6RPHt5FUdQJVcRhk4SL4o2ixV3y5oBXMzq
	 iW6oQyjo59EgrMnP2/CHYy6UPovXraz1QawX1HNJZ1KBcFJrs9+kiSYvb5Lbefu0GZ
	 rmzu8avPHpc/tDqKQoUwN6P3TxIc/8tXStmeRqCybTYEtKWFcNCqlZRxysNQDaFARm
	 A550x8qDCEGVudsbrYvYxXR7V6BDyDbb/ZrKFtK9Tkk7lu9nI/cP8SkybK4Q5g0huh
	 8McxNMZuqbCza6axqVcN4WaTaP6ICRCMoypIE8ck6B/yKBvIMy7OJS0RC9lgWtJoM0
	 Yf0cZUwz7tbYA==
From: Miguel Ojeda <ojeda@kernel.org>
To: venkat88@linux.ibm.com,
	David Howells <dhowells@redhat.com>,
	Michael Kelley <mhklinux@outlook.com>
Cc: broonie@kernel.org,
	christophe.leroy@csgroup.eu,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	maddy@linux.ibm.com,
	petr.pavlu@suse.com,
	samitolvanen@google.com
Subject: Re: [next-20260130] scripts/sign-file: build failure on OpenSSL < CMS_NO_SIGNING_TIME
Date: Mon,  2 Feb 2026 14:01:23 +0100
Message-ID: <20260202130124.354758-1-ojeda@kernel.org>
In-Reply-To: <47fa2bc6-e137-4123-b00c-937a8fd82968@linux.ibm.com>
References: <47fa2bc6-e137-4123-b00c-937a8fd82968@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 2 Feb 2026 10:06:41 +0530 Venkat Rao Bagalkote <venkat88@linux.ibm.com> wrote:
>
> scripts/sign-file.c:282:25: error: ‘CMS_NO_SIGNING_TIME’ undeclared
> (first use in this function)
>    282 |                         CMS_NO_SIGNING_TIME |

I have also been seeing the error this weekend -- this was already
reported in:

  https://lore.kernel.org/all/SN6PR02MB415708C0A6E2EB1B5C7BBFB0D49CA@SN6PR02MB4157.namprd02.prod.outlook.com/

Could you please try the patch David suggests?

Thanks!

Cheers,
Miguel
