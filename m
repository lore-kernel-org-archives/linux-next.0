Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E362ECE9B;
	Fri, 13 Mar 2026 00:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773363067; cv=fail; b=hGmRFQilsys120aKEOz9nu6fVa8k1Wm0WLrANj/WeCrc16cdqo6zaupHtcaFcPHH+yvtt6ABccrb8XFWounsjUa+OdbVVQWw5bF9Bkptq+dvDhUU9ileN29iFBiQCt6NUv1VTg8UQAOFpKUPngS4VHiy5PzM+hCIxdWYn0tUUNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773363067; c=relaxed/simple;
	bh=WVZ6sfHyz7VDw/0niXhSX3/ovAYIGcJgFpSR7/kqNCc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KM61YjdbSsqVrfKbA7q/JrBUR21a/vGUvd0QCDQIc4iKO+uIw4ZDJqPTeQTXn+Ftqr7ayWwGWOwS2yA34Gq2JFnlyKk/7uDpOX2uObJKeZFpbDQDn1VX2xWyAC+o9+Hh882nI6VfR1NcVYMF0ybgoOKNuVzfR9XZ7leULdTUlMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+GLrpJP; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+GLrpJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773363065; x=1804899065;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=WVZ6sfHyz7VDw/0niXhSX3/ovAYIGcJgFpSR7/kqNCc=;
  b=N+GLrpJPGmfrHDy7VpK1CMeB1EcU/ZGytRw0fnS7hRt4zLEMG5IJS7G5
   m9WgJFrKM/AkLv2mJcf/Nh7tc8GbR8Zzr6Y0rrPnmpVfQpcFIs1AjmNaN
   Yv/pOErzwXoVnPZPIyB2exki8lg57PabAwSJWsO2otAS3/v1ACi0ArISg
   GR9qVJa8kxylEOXcmakeO4kDLt9q9r0Uwk4s/vjXIoQgRKPfV6Fp9CM/W
   nZlIXKEBat4aaHaY9x7Z5YVEoaWtecUreiUwAnM/WLVMnRkBTRccCXFiH
   MKMB9N8vmimHBh2BdfNz+J/IQrpvSHcyeNacUHqNCiN77sPuOAGbGnphC
   g==;
X-CSE-ConnectionGUID: rFe3V8RgQMSEclkGyoncwQ==
X-CSE-MsgGUID: VBUlRORlQYqTjLc9FDdmMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74363599"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74363599"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 17:51:04 -0700
X-CSE-ConnectionGUID: FM+W7tsiSGaLIMplw5dtRA==
X-CSE-MsgGUID: FNIj5aqPQbu31zfIgjGsHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="218375748"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 17:51:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 17:51:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 17:51:03 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 17:51:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1TsvVs7m9/wCXqX49VrGZ0L6zkLyJ151OG9YVCCf3CvJFS1frymyw+Uv5pJ6twHq0mt0gqMLeg6gX7yFmxjx289vj38GIrAIypQViNXJnJs+lnGDzz84QD48GMMArHMK0MXSql2GWypcU8AmpC1/0s9g/Bo14YEnfBCu3MmeLhTFGW7OfI3E9/4Gd2vloXRnLPZBUHPWNcuqbCqDT5U3/r3dPFFjj+0Z7mE//PBNdmC6JEMqp0rjebXAfzFjhEji7KI3teXsjjFuTpAjM33Pz5yPWJBcYOEh+xIBMoVSMMbQVnKnB6TjIGEFsdXJyxM3e3uqKSPB7z0UHey9AHyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCAqpNhFFpHQbPo+aCtMqe+8mzXOjYATahehfBEMRS0=;
 b=W54wMZjf77w8B9ddIq/dLSy+95iSAddyjvMi3fyyztwqBQq8kv2rg8VN9iWta3P4kS6Vb9tq9sHF8NV/O5IJgr6xJnchymM+VExrrNgCqwhIxOQk1sANswYRCosQo+sRpl136IxbAR1d3YyXM9jpj+62vbxPQcJZt7VCyjU6MIGthyZMHCJU5C4swZeO76DZ8IbDa7QEWhWrBes3eBUDbM3sJX5WrGBc6G2Fa7VVTaIHBzL35XGwFmRXbUNVZPdyJhqmMrJPeMYCLeCr/4tFtcGxbEs4f/hzyOLZcehSd1596k6U1Ujydz6Viriqrpn35vL9UGNgK8a3sodTHLXSbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 00:50:57 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9723.000; Fri, 13 Mar 2026
 00:50:57 +0000
Date: Thu, 12 Mar 2026 20:50:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mark Brown <broonie@kernel.org>
CC: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, "Souza, Jose"
	<jose.souza@intel.com>, "linux-next@vger.kernel.org"
	<linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <abNfbWemfOKGNrVZ@intel.com>
References: <abFpM1FHgzgARB88@sirena.org.uk>
 <ae413dfe2aa2d18c0b4c44d4bdb15bb630db177d.camel@intel.com>
 <abGv-5kXSCtOTO8M@intel.com>
 <8ec7f38d87fd49a4c81a228b87b1ad244c9b9df8.camel@intel.com>
 <abHMaBe4Wo_PH4uR@intel.com>
 <7df1c2dd-1e62-4cc6-9fb8-9f4ac160077f@intel.com>
 <b7f67081-7b8f-48e0-8f9e-bcbad47165d6@sirena.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b7f67081-7b8f-48e0-8f9e-bcbad47165d6@sirena.org.uk>
X-ClientProxiedBy: BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::6) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ee7ae0-f238-446f-2784-08de809a9653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 6TtHDB2PXKQFlZ5fueyDL95xCqwxjme/HdXt8RalA8+srdzxrFqheAovvt4+kJsAqHuTtkP3qTcNTX3Yu2o+CYuO7cL0ot4bryoGpRiRhNRuFPXz2GiYbRp/O0OqxxGfjC9SmwtekkckRTKT2ZZQ0UmDvzHGpoTptMprBm+FGXF9UFzuu2vPp/qH5UiIs1hpnzsMPAB20e8TglhtK2LKXdi/O9kjwMLBIoATyfhhYofuH6dzYksUtX0sQ+0BfmeRhslQA+POQyPZwybqtBiyV67RLM4qMW87YPpJEr2ohdOp7BXw5MlHA+G8mogrqVQjPoFYy6DHTCT2VPQ2fAhtKalD5V8C92/5wEENf2WVdLSY/5qvK/Z8YxCp+n/wqO0c5qukol0DwllBSLh6595zoRBDtAtXCvA8EUa3hvbT4TzDWiAKFOtx8wLsIedTmBVsI6Ts597Qz7nhJ++r91wyfmxhzcuhxzB7YPcSnBWjOnGjejxGYwVJmJ8Fl1+w7QvXBuMiAXPfjvkw64om1bHWBQOwKIW+Q+xWA3sdPlxDoG/5j1+0rUKb1Sp69rRtDLoIV9nEWi7ZB/PyCdiJLv8UxMF6oFWizxE5prlsXLiT0Wf2Kn0QanQnT7JpKdu5Qn8kJ0GCHn8/tpQvmxbabzgzUAXJ550yhaoxQtY7Bq/LCTyR4jvZx1Qy0rH585x9o+8jVHUAYPygOOuXUXLBlpdpBkMltvEMVw0UmWc9RlvvP3w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2dEoCeJ8bWFsbIwcGSBXEXgJ/DIgNVBVaHU6Sq4PPA5JK3o/6qLi+BTtnsBG?=
 =?us-ascii?Q?Gt8VlWvG2mCtmM6HpawgV06sN8YoWE36zUo03X2c28rR3Ab0wNMhVisJPCrU?=
 =?us-ascii?Q?fHrMaUGXVF3WhgUicIhHvLFV2iEYlj9TM1vvO6usE56+U54Vcy1DQ5/EeGSP?=
 =?us-ascii?Q?VQXBehQAQCtY8KDM6qWLoR7LZq6IXk5JmtzYAojU3jUFeSx/XD7va3ePEtMk?=
 =?us-ascii?Q?uFE95kK6iDAV9SI85FVca01hHpD6mp/z2lnhpfrhD5ahKfdVkM59Zcv/rkYt?=
 =?us-ascii?Q?0VFH/BVrsIAh7fL4r5jZe+50NDWv9agMIx8phhEB/pVw0YdXufZoFyhr/nH7?=
 =?us-ascii?Q?n5ZkgDemqwNaWM/RUWryxkCXOsy9bT3F0oIWw/AU4wKAHIuXvOqr/0kG1jEO?=
 =?us-ascii?Q?bXZQ0mRT56hz1CuWFKgHMRLmkb2j+JqteYw4KxButCO9xyWlztQXDPUe2ExA?=
 =?us-ascii?Q?GRm3KpH1MorADy4j2jG8/cxy960i+08mSzmZKJDmvCjwPKJkaer6An6ub2Vk?=
 =?us-ascii?Q?LBjM5QYrYdJdyrNvY58Ex7VcambyjGstZlpVu4OBTx25AgH25zRb3s6hgdlr?=
 =?us-ascii?Q?zA2Cb1KaV7mvTlDfdZJapryWaoBen0HIFjz9LVC0g8FN1mYyjN57qiUMRlCu?=
 =?us-ascii?Q?Q2MPbk7qhtntbcWlp+EBeRulbWsfnDMZzvPueXwh45+9PCjHQ5+NAOUj9hi+?=
 =?us-ascii?Q?NeLtZPJWESYbcad+YAlIF2NYjyubR4JBjkeHbCCKMWVt8aRpEucQ4gwoRmnm?=
 =?us-ascii?Q?EE6G6Z+Ftap/+PVPJDgfhPFQ7VdRFVE2DQh24IKL+caBXsUPwsN9WCnVvuED?=
 =?us-ascii?Q?Q+9tGnNM5c8KLP1CjzXN2apFWsBPfZ/97I/ZRBqy31Ha71b5Z9OEh26vJAe0?=
 =?us-ascii?Q?8grpALiZOMq8rvFSko/6ZYjyXpfpQc+uLxNDmwnZ0NBE/K8+9DkluZeWDaKC?=
 =?us-ascii?Q?6wVWd+JioTDAw3lTBZUl10v53/5GELbFBs09UiUWwfT/UeTzN4eslzVcLd+m?=
 =?us-ascii?Q?Q0z9TmG4eBIcVrQY5bRCXdogeLwBUi9kLyTMWS985lF4x+d/nAW38LQF3Sfu?=
 =?us-ascii?Q?SuDQxE5+zVTOWjv3Qlx+yQa8KvCKSNUQug7mFfrifEVcuqOvyHNV159gf/U4?=
 =?us-ascii?Q?gZhBTzPDDWoGYb2nuQA8oV5xV8WJvZ9Ysmvc6xq4anGFjDAaiUTwhpHQi7a3?=
 =?us-ascii?Q?UflQKby91WRcuBMC3THazkI+WCoeNshhMCdqLCVz7g3K1UkCIcJ2VpsFQsG8?=
 =?us-ascii?Q?dAodB74+faEg1wdHiPhdO1cdjrkPGwZxtBfFips2Rva4H4dNqMJjanDXiJDf?=
 =?us-ascii?Q?mKG+ouhu/BhpoAmX/I8XlKlmwU1FH81Asq+mpS1W/li/DOHidfRb8AfLhYLk?=
 =?us-ascii?Q?ULcWpG0KrrNMGVBtHG5dI1oNe6oaEok+xAhwbrb/TRGYKhb1xHqbZshW0nRw?=
 =?us-ascii?Q?zV2CKCaerSTyHjnAOjE0pgkLyX6c5iljubcWONwofxskFikaPYlarHFz142R?=
 =?us-ascii?Q?gXeCP4S1mG5YhyFr0kRpvhCozuWca0NKRxZp9AuUNmT8clVb+UAYzgYo6EYu?=
 =?us-ascii?Q?noOig8FYbEk4WPPOLn5uiaAM4xBeNPB/CiPhKI7dqORsDQ+dKBfegP4Ar8Cg?=
 =?us-ascii?Q?I/q9g6beoBBFRmZcdhoILzb+HI4ktnHZ2HUffNo8ggqXLv6ROXrKwcwa6Y23?=
 =?us-ascii?Q?ac8/Vd1RGjD1pEGfq+InJMAHx3/+NK9mkDE4TzpJg/EMQQmI6iOkG46LELgh?=
 =?us-ascii?Q?hpFtvuWyhA=3D=3D?=
X-Exchange-RoutingPolicyChecked: bukWcB7yKhI0aoLSdd09a7Zk6gfujFmvx2pu05UBkGrAmzAIN1c+u+2H+CrZH6+O3cw2T1oG7OyvEasfawIRGjIXinRfs+2GLr4cj67gFM33Y+0+Zbo86AAhKBgcaIyMr7LNLUipCP5HPyHqjr8bGcVXvgZLupkepHhlQMTjl2WSuZKW6UhgLtF7jy+0NkFxxP+vidKCOcRzaVCLuHXm6CgIgMrGX/1mbLVuQr7b+EtujZty49yX4g7KZsSDrKsd6XC+4iFeOSO8HdEbA3OlheJlZ0Hkm3pvhQLUfT1vf29Y7ys3r0XE74J57JnTNh4B1U3JlLiLJQZwVmB89Xu1mQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ee7ae0-f238-446f-2784-08de809a9653
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 00:50:57.0526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oniJTTD3DMIlFY5Nzf0b27zOuen7UhtdVqkHbzA/LbpsnJbWKPvyId+7a+4jXDlKFs9BUzflQDhBb3EN7LRhlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8393
X-OriginatorOrg: intel.com

On Thu, Mar 12, 2026 at 11:43:40AM +0000, Mark Brown wrote:
> On Thu, Mar 12, 2026 at 09:47:26AM +0200, Lionel Landwerlin wrote:
> > On 11/03/2026 22:11, Rodrigo Vivi wrote:
> 
> > > We are in -rc3. Jani might be sending a PR in 2 weeks from now.
> > > So, we might be in sync in 3 weeks. Worst case 30 days.
> > > But it can be speed up with the help of the maintainers I mentioned.
> 
> > > Lionel, what do you think?
> 
> > Is there no process to deal with kind of merge issues quickly?
> 
> > If someone comes along and changes the bitmask macros again, do we have to
> > wait another month after that?
> 
> The usual thing that normal trees would do would be to make a shared
> branch with just the API change in it that all the affected trees could
> merge and base their ongoing work off.

We can work with topic branch as well, but the backmerge is not a hard process
for us. We should just not have rushed with this patch to start with, then
we could had put the branch in sync.

My apologies for not identifying earlier that this was the case here when I
first tried to apply the patch. I wrongly assumed the patch was not based
on the right branch...

The pull-requests are already happening, so we should be back in sync soon,
then you can re-enable the branch.

Sorry,
Rodrigo.




