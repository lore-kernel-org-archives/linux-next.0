Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B07B38551C;
	Mon,  2 Feb 2026 17:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770053663; cv=none; b=pWca0HLHXijD/NNGq5bK9IKocdCRvqUpC7tAaZ58sq7UK11Q/KhqjC4rmqe4UuqkzblR0dpu5AZS8EY/WNnXSWn1H6DkPPhV7Z0f3B9O5nlQx9tZX8/F2a2NhKoFKr8CT9etWhP6mbbjee+bY8KpG6C3VYxDZHCjfj3fKSzaS/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770053663; c=relaxed/simple;
	bh=ivP4KBibU2i2RSWcKNVNXkgc/bOqFq5m63tQXQb+hTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGW6nJLB7HxW1oroWfXTU8A3DhkqzBHnsvC424Bexp6YfYMmbBG8q/a50JE3HVO6bW+pbyXPs/xG6EmwXp1/Ujknh0kTHzX1EI7UOHD21SEmLZPEA0rgMpaX/7vBjXHResQfZyYSaT69hwIHtp2xChYvXTXZY3seJEjUXBnOsJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZxLQ0Gr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZxLQ0Gr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770053661; x=1801589661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ivP4KBibU2i2RSWcKNVNXkgc/bOqFq5m63tQXQb+hTQ=;
  b=MZxLQ0GrRRYOK34U3BtzR1g/pqC71lPXlEedlVpzFDbzTcAKq26r4Irp
   /p5RH8je3QN0wtHLyCSJl/TUpLviRmsWLNnmwftoLJUJpUc8iROFiQ8Zr
   qhKc8P7FrW9j3LJ8NaHKzPtnq4m9X36tMDqxPP7KFdZOeQwe6i/R0+4+H
   DY05dJnjNrGAv8m4nmupxE0OAm04Q3s+sD0ykvpFW2ECGJT0nvkw5xXuq
   ujE1gdmC8mvcLKDDEK+dIfm69N75xd/Exwzw1FjA552aos7pAyk7FKgMk
   kX26kEcVElVjlyEop9kpqbgtiDJiSzR6M9p8HHx6QPO91IAOCbQaWmcHH
   Q==;
X-CSE-ConnectionGUID: Zg7Fv2mEQK+z+nJHkYKWBA==
X-CSE-MsgGUID: sSA5hQo9SN+gWB2h3MDF5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="96672802"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="96672802"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 09:34:21 -0800
X-CSE-ConnectionGUID: 7K8kEOSIQnybpTLHuu03Uw==
X-CSE-MsgGUID: GvqbpZ7yRDyK40jGfJLdnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="213695131"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.13])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 09:34:20 -0800
Date: Mon, 2 Feb 2026 19:34:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the random tree
Message-ID: <aYDgGTtXCN8GMVI8@smile.fi.intel.com>
References: <aXPso7beaFvlUYiP@sirena.org.uk>
 <7bad538d-5b90-4741-9bf9-b4f6f708048c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bad538d-5b90-4741-9bf9-b4f6f708048c@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Feb 02, 2026 at 03:22:44PM +0000, Mark Brown wrote:
> On Fri, Jan 23, 2026 at 09:48:19PM +0000, Mark Brown wrote:
> > 
> > After merging the random tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> 
> This regression is still present in today's -next.

Please, revert this patch, as it shows more work is needed on arm (and maybe
other) side. Meanwhile I installed compiler for ARM and I see some issues even
after I fixed quite a few by the proposed changes (in this email thread).

-- 
With Best Regards,
Andy Shevchenko


